Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D31CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiUrH4xoFLpy/PuZ9JloxTD7fWhTm5wGcBSZSp+4VjE=; b=WYmbnYx/jjU9N1qkTkucS1or0b
	PK+3LGRazEtrHLN6OsDt8P62hmtxuqzFQ7wSX8Oc38fdweZ0YSFPIbu3PZpMAe9EKufXTLqjYNSLy
	z8T8DKImHBsbcgS/DhrXNuiUwa47j7kErjPhO3NMoSiosL1vjL64iqk6ORiCDk0L6w57k0HXSGa9y
	fd8YXPT4+dfcwoBabRr6/LEqgB5y3pTUYYHCe1W4jk44iBmzBO20Q8dI/3CRRyp1lZlicdrML69dI
	mgkQ4jx4jEENk80yhDAcaLMrfPuW/CTVwBBmPdej5GymhdnXutR0RyYXB50n+nYHMZXIZeP8Xh+u5
	/frDlRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5qg-0000000ANT3-2npt;
	Tue, 09 Sep 2025 21:25:58 +0000
Received: from mail-il1-x164.google.com ([2607:f8b0:4864:20::164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5qd-0000000ANRA-12ZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:25:56 +0000
Received: by mail-il1-x164.google.com with SMTP id e9e14a558f8ab-406630d3b17so27028005ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757453153; x=1758057953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PiUrH4xoFLpy/PuZ9JloxTD7fWhTm5wGcBSZSp+4VjE=;
        b=Q9AaQUV3zxHTcWOU9cT3a0zFW5fD1u7ovQtN0AY+o+DZ2VTEX+Kl9xnZoKSMdfXD7/
         NLfLT4nrRgDIbMckdGxJfadAa5lzB+VcnjDOzEM5OdTKRrI4HYYRH1zu9RLuTXdY1gSW
         6zW7SEclvkAJAz6VOMSledd7/gYSU6zmyyq8t/WcS1Y7BvputFXZA4+VWWqQBJ7unYPu
         KdunE1v9cpkVVlW77M+pW55eOq32qG26rDybKAimH3y3ZS2c9blNBZWyKxWSJJ+gYL8f
         LszBo+Q5Aad91x+RClN5XPqgF8Gbs+qfjQPSWLuIehSY5WQvwX3AsvjZA5Tn2EjiY6xc
         wRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcImx1cbiXBa/bIkx6e5zJ6qt2MOX45kI2yYXwWZ72KMGExLpDwbeP2KRT7v16HGbYTMFSaq8Ibk5e/zcOnzHM@lists.infradead.org
X-Gm-Message-State: AOJu0YzYZ7kAv+t4lS7EIlHZi9gdfAcWDijPRvbj3gk/90WQqdbHk/Jx
	1zBARzlCG7s8oLWFiXo9h60F1OdffJcpkbBzhSA94+KhkyQ0HhlTOqLbHVtcdH105gI6NEdcqKK
	iIMl9uzt7hZWdlfulTP9p2pnptbZOAKj7PzXAbp0MOmVXmEELgNHXFwPG+nKFPRQpOQoDd1El50
	aD83QODGbZydMzLgFgbyGtoPz+aVwqWOmKnVH2JOsmnh2eQSKKJ9thoOJ0GaD1y3VCx/UWI2Wt4
	iFnVHYMswjF34l/wcT9MoykOYj5zZDF+Cs=
X-Gm-Gg: ASbGncvmyfnh3wKUSMjMnJnGKf9Za80CtbXmZRU7dDOcFKzj6OGTLj2Y7TqOUlUCrsv
	k9x95MZ80+hM0bSCfequ/LAdl4nB/dVydu28R0ydUwjGJcOmhZmFQ45W0rsVvN0qyDh2eaYfLTi
	/DXm0hZ3buF+KX8FcNT71nCuBOOKusb5fTnYsvNFZ0TEletRMk53MXJfDwQk75oywdEm3nzuaVW
	a028qmnN5BVE1PAkn5CgYuf0Gxwngum4BUOOplHJMOCxOfyY2/lC6BLnWK0DXqapjGTqb61xiLq
	zl5y8h8144qgWheRWfGK5R58za2uWcDZnfdHl48U1cXnCSh/fJ/dMehZCCABlyfZZ5gOXfbMog7
	KjwNW7yO6qMP6MAziQGytYkSGSKc859eFvxIVF8qVhtfxdjecMkMDtC5Uwd0j9DyVspnNQF4q2l
	O818C4
X-Google-Smtp-Source: AGHT+IF5QLEehmFslAStvjagHN75d7aq4exIL44kQ0KrSzSqfWeRPkm4v9C36ElQ0P2GJ41e4UmudNzDnect
X-Received: by 2002:a05:6e02:3788:b0:40f:7f8e:610c with SMTP id e9e14a558f8ab-40f7f8e6265mr82007745ab.3.1757453153538;
        Tue, 09 Sep 2025 14:25:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-40f8f17ecb7sm2982375ab.20.2025.09.09.14.25.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Sep 2025 14:25:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b522037281bso2928892a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757453152; x=1758057952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PiUrH4xoFLpy/PuZ9JloxTD7fWhTm5wGcBSZSp+4VjE=;
        b=YEkCfft9Cqlgm8e10BobJKTAw5TIA2QHtDEcM00RvVhncAaZqDs7/XHWx3ckg6PHCl
         ADaYvtXng11J4PlwF6SVBDIWnS73vQtZdrWXvh988qoWTTA7+iIxTQUF92NQQerMct1s
         gCRLhqhYFwqMjObZuHhH4uZnDz3TFB02mxRak=
X-Forwarded-Encrypted: i=1; AJvYcCVYX5Iqo3nyvgE+3CcxpLcUm22iMWM42oDfXYZPgpKEYAzHtUirNVZeCzeX0QcoV5Fb1bGhCeO+F5p2tzHf0J94@lists.infradead.org
X-Received: by 2002:a05:6300:210f:b0:24e:3b70:977f with SMTP id adf61e73a8af0-253469dbd3amr17194789637.57.1757453152117;
        Tue, 09 Sep 2025 14:25:52 -0700 (PDT)
X-Received: by 2002:a05:6300:210f:b0:24e:3b70:977f with SMTP id adf61e73a8af0-253469dbd3amr17194770637.57.1757453151765;
        Tue, 09 Sep 2025 14:25:51 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774660e67cbsm2994494b3a.6.2025.09.09.14.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 14:25:50 -0700 (PDT)
Message-ID: <be4cf5b5-b2ad-42be-834a-86985fa4aded@broadcom.com>
Date: Tue, 9 Sep 2025 14:25:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: rp1: Add USB nodes
To: Andrea della Porta <andrea.porta@suse.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iivanov@suse.de, svarbanov@suse.de,
 mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>
References: <16d753cb4bf37beb5e9c6f0e03576cf13708f27d.1757065053.git.andrea.porta@suse.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <16d753cb4bf37beb5e9c6f0e03576cf13708f27d.1757065053.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_142555_436190_B0655913 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 9/5/25 02:42, Andrea della Porta wrote:
> The RaspberryPi 5 has RP1 chipset containing two USB host controller,
> while presenting two USB 2.0 and two USB 3.0 ports to the outside.
> 
> Add the relevant USB nodes to the devicetree.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Applied to devicetree-arm64/next, thanks!
-- 
Florian

