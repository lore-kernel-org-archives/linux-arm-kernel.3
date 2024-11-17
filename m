Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D09BD10F25
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1L0XnKz/Bgs59CaVEtu2B7ERAAzylQiFjbdPs2G3uUA=; b=DvNR5aZFbwDDCT+Fibus6VPzaO
	FI3hBeC4er9dEqrwOnhK+m/tLyK7imetmLIVstRMvSLBajQROyn7Al2blRr4PgB+emIOhoTdXhPWz
	/XgWesnVqEy+yYvXjTFPnqqVu93y3wWtnVVuytbgczthiJwWMMoRdDEu0fiaqvNEMA2uEWW1N6x46
	OM8lehbkHzNmwe//m+n6+B++J5kcNP7Cb1XSUo/eWbx7pIm5jVizIFpE8aPQnhn9+uLqoD6/IZHYR
	9MaXxcGt7szx53xwBfS175kekzk1gKjqkhcXQib/lyS0gVOxkkz0GzWDBeWlPQA29jQ2LWwdRlDHH
	2AlsPQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCjEP-00000007cby-33CR;
	Sun, 17 Nov 2024 17:38:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCjDU-00000007cWo-1j8l;
	Sun, 17 Nov 2024 17:37:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so18856075e9.0;
        Sun, 17 Nov 2024 09:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731865063; x=1732469863; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1L0XnKz/Bgs59CaVEtu2B7ERAAzylQiFjbdPs2G3uUA=;
        b=IWtFAf4mbPYvX204e0here2E3Qh2UWsBnYZZyp2PXH89ZmvBRxFpbblMHJDlzWDG1f
         0+gAvBHVkOiUm6tz+w08BgXT9AaE6Rcn5+FIGm0K1YJ1X3MIkDFLc+TQr6ajP2ooxWh0
         McceWdFoDZOpCdUWOtWKebGmhou9VwXgbZRlipDYCBy1uiwukzKOBWVkjES9TgEXAhtN
         yg9R4cP0nIMkOzCr+jaLDmnqxYWtg9QOBXKXIHYgcMuYxqgPHEkRMr5m+ppZNcUxEPQV
         XNoYuiG7b/qzFhe+0rWs6Smra3zwgbhBwiTqYvswE5kiuCKlmY2ahKGk7YpGIMqw7hCz
         iR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731865063; x=1732469863;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1L0XnKz/Bgs59CaVEtu2B7ERAAzylQiFjbdPs2G3uUA=;
        b=E/hdy/oC3lEWicFmv5t01MgPScyvvBNVozR1YEG906NcKLY6AkmV7cU2A99JiqglcP
         IbEUfCZv/QdjmVQKPq/CpaSY7Kh/IMrTPVYtfsxmyNDmtomtDLyAEtjZUWu0HB/855Pj
         rW9de+lgIBTFdC+USM/r5GUZrB/+9MyJ7OaSLz2hZ+TVYKnMD/CS3f/4QDH43C5TUcwU
         DGA/I17aO2f7vHRbFQy+rdB1o9aGpjKnoCwCgOZKJgBL55SUU7QiFtWUQYLsJ9wtBOT9
         Bwahvpk3/vbfyMlRpvV32Thomd9jhsT76vynxinsvAeOWR4NgmYhVCbLPU48n1t53Acp
         iPbA==
X-Forwarded-Encrypted: i=1; AJvYcCW1fJAO/U5fzUdgXYI4JmW7pPBa8Lu8x82bFrALCw0Zkb2p/c5aSOMiRN0/iKilqhAm5ynrFSVwZB/FMwa4hq4=@lists.infradead.org, AJvYcCWhHXNtMrvTkKwklKQiOJplmTt+3xd1BX1QGLpodFcItEHgCtUg23WIezTePc6mAKFL6VN1PWIvJEiRHLoi1JOV@lists.infradead.org
X-Gm-Message-State: AOJu0YwUxXWEIUz4D5BCDZwZE5OdZxhRQh1S3GdzvuIfgix9OFTuZE3h
	FqBCcuF7WiUXhqXp6T5FFMd6lqO4VzCpdra23G5r2BWA89MB8T19
X-Google-Smtp-Source: AGHT+IE/XAQXxkHFy6KvWJLP0RKL+rq45e6J5Y+YNFyBIw8NtuYv2A6BeGdBO5NUD9ysHPfwh/qb3g==
X-Received: by 2002:a5d:598c:0:b0:382:22d7:b87 with SMTP id ffacd0b85a97d-38225aafdbdmr6163594f8f.58.1731865062450;
        Sun, 17 Nov 2024 09:37:42 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382417f33b8sm2435994f8f.45.2024.11.17.09.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 09:37:41 -0800 (PST)
Message-ID: <3bc8ab6266c7a1c54bbc0d6eca53019734029cbb.camel@gmail.com>
Subject: Re: [PATCH 2/5] scsi: ufs: qcom: Only free platform MSIs when ESI
 is enabled
From: Bean Huo <huobean@gmail.com>
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
  Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, Mike Bi <mikebi@micron.com>, Bean
 Huo <beanhuo@micron.com>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
 <linux@weissschuh.net>,  Luca Porzio <lporzio@micron.com>, Asutosh Das
 <quic_asutoshd@quicinc.com>, Can Guo <quic_cang@quicinc.com>,  Pedro Sousa
 <pedrom.sousa@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter
 Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Santosh Y <santoshsy@gmail.com>, Namjae Jeon <linkinjeon@gmail.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 17 Nov 2024 18:37:40 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-2-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-2-45ad8b62f02e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_093744_481662_B2DEDA2B 
X-CRM114-Status: UNSURE (   7.25  )
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

On Mon, 2024-11-11 at 23:18 +0530, Manivannan Sadhasivam via B4 Relay
wrote:
> Otherwise, it will result in a NULL pointer dereference as below:
>=20
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000008
> Call trace:
> =C2=A0mutex_lock+0xc/0x54
> =C2=A0platform_device_msi_free_irqs_all+0x14/0x20
> =C2=A0ufs_qcom_remove+0x34/0x48 [ufs_qcom]
> =C2=A0platform_remove+0x28/0x44
> =C2=A0device_remove+0x4c/0x80
> =C2=A0device_release_driver_internal+0xd8/0x178
> =C2=A0driver_detach+0x50/0x9c
> =C2=A0bus_remove_driver+0x6c/0xbc
> =C2=A0driver_unregister+0x30/0x60
> =C2=A0platform_driver_unregister+0x14/0x20
> =C2=A0ufs_qcom_pltform_exit+0x18/0xb94 [ufs_qcom]
> =C2=A0__arm64_sys_delete_module+0x180/0x260
> =C2=A0invoke_syscall+0x44/0x100
> =C2=A0el0_svc_common.constprop.0+0xc0/0xe0
> =C2=A0do_el0_svc+0x1c/0x28
> =C2=A0el0_svc+0x34/0xdc
> =C2=A0el0t_64_sync_handler+0xc0/0xc4
> =C2=A0el0t_64_sync+0x190/0x194
>=20
> Cc: stable@vger.kernel.org=C2=A0# 6.3
> Fixes: 519b6274a777 ("scsi: ufs: qcom: Add MCQ ESI config vendor
> specific ops")
> Signed-off-by: Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org>

Reviewed-by: Bean Huo <beanhuo@micron.com>

