Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BFEC624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Usv5SNynw+4aZQ9DPp9M1Ly8wN0kqlGi58tc/lH1VY=; b=DAyg5MThMUYSHA4FLOAbJEwnYD
	x4w5tnMb7kyuwGm6XqBOjelDhtAUCSbIzFTVq9sdP7St6g/oal2riBhHTgNkpCVr/D0vlCL2Wo9yP
	7QDJg43Q+EDK/V77x7AtP9dKlvTi3pl2Eu/bThU2/HobAPkZ4DG/nBTOa6q8G5xHUxuhntwITdlkJ
	5O3NMqBYI3Sq67ck2eVbhYfbzYHbxNoyOVjdGOw+gplzg5HbNO2M/JjgkT4InY7dmrUD22gy/8/c6
	diRQUpFo/CUqQGyUX97COW5XbwjoW+KgQX70RdQPPoSqelOu7UckpRKQAAjoNWum/kVebook8X/mq
	dwWv3Jjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DHN-00000000UtL-1lxf;
	Thu, 03 Sep 2026 19:39:21 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DHL-00000000UsT-29wA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:39:20 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so380361a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464359; x=1789069159;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Usv5SNynw+4aZQ9DPp9M1Ly8wN0kqlGi58tc/lH1VY=;
        b=J77NWvSqJjO3XTvWUf8+LJ0oegn3iPsxqDXBqunjzpB3wrTWE3KP/Cxf3ZkicHfBBB
         UPHaEtzW41xtMDCG9aC9CL1DpoLqIRM/fCTM18UVceyq1Axa+hWlKDr5yyLsN8Kt6zJw
         o+ZdseQFAonzYKkw/pNgD1KOxYFfNqcAEvVJL6eOZkooGb958vl7rnS8rrerksDuP059
         t/DyhrOykrk57JvtQS0NnDbXoBjrsFAhrSXHIC+M17BooACZtsWvQGfp8DjN/eRFiOJA
         eGYrqkpedhprliVapCvguVPArlvnkTZ4k2M5/7sfK3TzjAfcG0BYJPLaKAOya4WOWswZ
         YQZw==
X-Forwarded-Encrypted: i=1; AKwUvBxNTQRNc2ePegCQucLxDKEbpkTLU1s7qPGXIltghY8UcWiZAM5MhSWKby9XYIKd5pNuasZX2n/0W0i8hjbfputL@lists.infradead.org
X-Gm-Message-State: AFuF++lAmSDST68U9oNtNmJ+PkmnSYYiV0tBqbcLRnx5ByPGXDAMA2fj
	WT4bMiMiDq+0CDYqhNEN4C22vRESS2w8Q0G31QOR+UGYpF8bTlMiunRjXEg4Pt3P/2mG9eazTy3
	IyxoKkKxz/R/bGWfc0HKseVbg+5UswxJXFzKa3GSOAsVVEqn/ySj/xslBydYSN/jk05cV0rL3YZ
	midnHt64kLNsGfcG/4JMiSmlNamsV3sqDJM3245ibvjWjswsciKYO128qaDCA6fqWPSD2swx0QX
	EuiBS3zPJdL7ukYAEZFHpQ7qsYMJs5nivc=
X-Gm-Gg: AYBFou3N2UTVmsTV1hL0yQjCpYXcgAVch3YHYo9jR1ILy+AICUMzbTajHhqxD4eXUWb
	436nCuZztgLRiqXJ0TKBB0cSah9d5XCJulcOn0J4YCQJ7cKrCGnPCZpQ0u8CgIokc/2MSXbJF3y
	bq8ytF8lJxrSiXafa4lu6Vg43LhWWM7zdvwbXUOwmH4U84K6ZFAMpB34zVSCqbFFjUhapu+upzm
	sb3VFZJw40IkQ1oTQfeytv0h8zUAdYJZDYOZmX3BSNqjq8yzPeAJu9KYiFSrIR/iX3dM3wRCdtN
	fXiwfJ5Ah46zBkogQE06ZBZxEzpffc/qYlJRT55VN/KZ3XULS6D9vYkM169mJE7Hkqv61RSJBtK
	Id9VLyIDNTfV+Bx8GErs7RSmrU5pLwxv0eIR+2KB7fghWlifsO2h2ZFEkNdotx3i48u40Fh4eHR
	KAmNvStj89PoFGeZ+MNlP6prY3fC1Mypga49A4smoN
X-Received: by 2002:a05:6300:6141:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3da39bb4495mr1215165637.3.1788464358555;
        Thu, 03 Sep 2026 12:39:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc4553f9329sm26784a12.6.2026.09.03.12.39.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:39:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so235435a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788464356; x=1789069156; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Usv5SNynw+4aZQ9DPp9M1Ly8wN0kqlGi58tc/lH1VY=;
        b=TVUbtQrDpeE5orkNgjE3k2uizBQL0ANCLkyiNSoXD4+waDah3LxHD/LDBg2+L7yqnA
         sXp6wGqFgjbmhtBVdJl5aWlkZQ6i390BMwija4Okv4HUTY8xkMJ3GvLuyon69s4q1qCo
         1iK92A0mA9ygv0CQMhRbzv/2lQ6la+1RMEXLg=
X-Forwarded-Encrypted: i=1; AKwUvBzoACKadElOL8dw8v+ScV06hPji5l792WGOgUHLW3w9+BTJNrQ9dVzYteFLJ7UwzrySBhdSivWFOKv31UN2up+W@lists.infradead.org
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr1333679a91.1.1788464356597;
        Thu, 03 Sep 2026 12:39:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr1333593a91.1.1788464356086;
        Thu, 03 Sep 2026 12:39:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm1349016c88.14.2026.09.03.12.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:39:15 -0700 (PDT)
Message-ID: <31166950-1099-41c5-bcf4-13e4641dbfea@broadcom.com>
Date: Thu, 3 Sep 2026 12:39:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: bcm2835: Add the V3D reset line
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
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
In-Reply-To: <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_123919_555755_996BFFED 
X-CRM114-Status: GOOD (  10.62  )
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

On 8/16/26 07:05, Maíra Canal wrote:
> The PM block exposes a reset line for the V3D block, which the vc4 driver
> uses to reset the GPU when recovering from a hang instead of forcing its
> power domain down. Wire it up in the shared V3D node, covering BCM2835,
> BCM2836 and BCM2837.
> 
> BCM2711 already describes the same reset line for its V3D node.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

