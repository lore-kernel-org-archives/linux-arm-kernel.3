Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0ECC83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 21:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMzvf0inoVdnAwUYh7Qa8/sYrJIk/w5RMhrgarH2W2E=; b=KQUtHfSd3252fJlb8jQHM52PO+
	K+KiIW47dJoyNp1CQB0F0gZDUHPy0YN2Co0xbcHtMa2TQUHaPXATdlVo3Ay1mNa/oXEMg+seWQ511
	Q8kiQA5u7NGctWs9jRO58AT1fVbOCQEjO72tSO718VncXy/qz9yWg6c6CjChQPHoS5oUgvCQoZQG0
	IfWzHNctAWUQdkWEc/Q9duZ1pgyOEDjbOpy0F9S3cIu0QfCH8Gdx3xyEipg1etyibxOy9zoC6QJzE
	C5nAVXycCAj0vTtqevIzNnbgfyqpwH+7mDkW33/h85GGikchHkMJN9TamS9ZSC+S4PMf0cy0brkbH
	LtBnllUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMP9-00000003WX8-2NvZ;
	Mon, 30 Jun 2025 21:51:11 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMKY-00000003W1j-24BA;
	Mon, 30 Jun 2025 21:46:28 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso2437660a12.2;
        Mon, 30 Jun 2025 14:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751319986; x=1751924786; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMzvf0inoVdnAwUYh7Qa8/sYrJIk/w5RMhrgarH2W2E=;
        b=b3vF+X6iYOYKdX/7/ZQyY8i2myvpK5ZhP3AiF8a1N653/s1wXJ0PoN72ua3jPaogw9
         uiLeO2+4oSwotJxKJFq1O5xU/HVIWDaoVuJe/ByOxC7RV0PovajT8ywPWTcT4FC8pQqY
         wy/WiWTYcn3oqztyDZB+EyqYt6yBt2sOg/geW8KrEPYU3Ad+smarXfbC/XHqR/ZBKRp5
         YvwUm17fgMpaA/2jEmWTbUep8X0JTklNfu1lF8MQ1bPke1LUTQf1qwXBC2U0w6u4zIqj
         vaFRYJKVpT5fbMlE+zqlIQKYFAIC7llin1xbK4bkBhCOkGMFe/PmrtHtEwpRpvxmHzmQ
         gO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751319986; x=1751924786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMzvf0inoVdnAwUYh7Qa8/sYrJIk/w5RMhrgarH2W2E=;
        b=qp5DtOI/xQlUF6YcO9O7l2X4iwiWldCuucnr82INnA6eoD/bowxKvzxfecPAmBUFmi
         iUpIfZEw8s1yuiIime2ZjF+0wrXpLaFlBZsXa+ZSCXzU+ej31KL2KOHq1JXjcdpPWXCv
         NKP5RFBtsuoPmIGPUVJnIb0yma5aTpvWdklFwajRh6x8cWhbfQ8XO/x+H8dxa7S/xCQc
         4unc4KZpqfLrndCG2KWDoZKBthKPdgf61eU5w6+SNIbzxbiHRd0tWGIntCJl3iAZ3Mbm
         Nqejnp3nSbUQZtHfdgo2iIfIuUPX54FVLtJwtyB+dHRKwOpvMP7HAR8XL/YK98AXuUaD
         4Lig==
X-Forwarded-Encrypted: i=1; AJvYcCWGG7TrEPwLH5SfiXzZlvX1XZLaHWbz6YncPGLs1alIRhJI2OnP4Gxb/LdTNUYjfTQ+ZWXMNd6wSjCZDa1KYxCO@lists.infradead.org, AJvYcCWRvAT2LphgirWj1bG0ifXOXJobysHc76kwhT7QARbYo869JA1u3cmTlTX+LFnneCp4PNjEsMZI1P7X+Gn3dnA=@lists.infradead.org
X-Gm-Message-State: AOJu0YymDXM79XtfvT5aUIm/fBh3WFVphw+3QvEnhe/pZDp/Va672dCW
	VFcUip1KuIVNSGDAkIV/Y9PLav8JtMsxlVJTwvOTsWrIEjCP39dsbd2K
X-Gm-Gg: ASbGnctsi2wwj7Sj90+xdiWvY4N7zAydOJmJg6YssL93IUA1JjHpMpWpTvocEzQZdcd
	MbxpKTYE5dW6JfO6qjG8GYNEahvQB4ABMSnhTblHgROfzxIuDcwayDfQ4vbeo/FgStNC6N4psvV
	8Shb0tcl2Nvozwt76ms/pMWIg21hD5ues2MbWY9CitcIMp5A4bkaclA4tfif5FW4iOSUFAiKLGc
	H1Q5XIqvkCenjpJdrllC9Kdl9V7TU11dZH+Hvp9Nyq6OmcgmAmm3Ty3ewN7gR7w9icFd6/VbXxm
	fdqI5DcymaoDJe99UzRYvmj1gl6BgB9mgwUfgpogOU5mQ2scxJVaHZUmhCFyXQ==
X-Google-Smtp-Source: AGHT+IHKxSYWaV//bpv91swHLUVsoYm/dTB3IzxzX+iLpaTVjfaTfoTO6Q7QT+X+ehW3AxFWJ2qpBA==
X-Received: by 2002:a17:902:da8a:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-23ac40f5ae9mr236065555ad.23.1751319985602;
        Mon, 30 Jun 2025 14:46:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b99esm93192165ad.102.2025.06.30.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:46:25 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:46:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
Message-ID: <667whxdsghpao5irl66oh66l5y55m4k6n3ztifaizbqtrzccju@cmghlz2yauxq>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <41f3cc74-694e-41be-b767-20c7561990b8@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41f3cc74-694e-41be-b767-20c7561990b8@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_144626_529200_8E64F26F 
X-CRM114-Status: GOOD (  10.03  )
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

On Mon, Jun 30, 2025 at 01:18:40PM -0700, Easwar Hariharan wrote:
> 
> Also, it may make sense to CC: stable@vger.kernel.org for backports

What for? Stable does not need a patch papering over an oops, it needs a
patch making the keypad working on the affected device.

Thanks.

-- 
Dmitry

