Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5627BD10F26
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 18:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuAX6dOTq5fZ6dymYZ0ndr0pKOruoIR3MEVZ5soZmgs=; b=pijQKXmLoJiJo3A79+fOHcFlCR
	ozTCeomhYkIflJng+Y5shhml1xAJQoC59Myrbt/HDwupq9Aj66Ucqo2P/35/ek7w3ywKFS7yM+hoD
	Yr4OafEPXR0D/P7XDlUdbRBoSQuesTUoY81ZgUISfFbW2tEoBb66fyDjrBcLCiCbK7I5fS2uuoyyu
	qWvXXxIVEuY3IOxQuuRnim0VLhermGHQAjHxMmMY9+4V9Ey+ysqZhb965iPb+YbyEdosnNpOu+WGx
	CGqCqLIx4BPW760Ut4GUC1IjGsb+bAlLHRDGUGaQenpYrrL1fv70scT6/85ZnQqdVVJ2QxJip4pEz
	oYcl4Rhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCkIl-00000007hGB-0wyR;
	Sun, 17 Nov 2024 18:47:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCkHp-00000007h8E-20pp;
	Sun, 17 Nov 2024 18:46:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43193678216so31788885e9.0;
        Sun, 17 Nov 2024 10:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731869176; x=1732473976; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZuAX6dOTq5fZ6dymYZ0ndr0pKOruoIR3MEVZ5soZmgs=;
        b=Wlm0IPjMbpUzSlXbdROUwL/EO3GgyJMpxSwRtpG+XZjsfyQP3cRXDW2/pcibqtndTX
         z3Zh9q0oNMSn8IOyu49Sp4t+G8rqTcUbIzaJlShnkMhFgscJ8FM49NLj2eD+Sxk6P01W
         UPT6RQRkPygdc0sk5EykWwHvX722BWxBmRB3cN2f5vQetfXjegUf87RNRKohIDiuGoFS
         oQnvs1zZzCSJpDEV6cRfuBI+eHLO6ey5FMrOls07lvOY2Jp9uXqqKl3GVW4pA/a9XJyt
         vaPSlkHtY5uj2QK8io0OxalIqFTRcb4aqH19ScilOwl9y7IhouUT2f+Xl/19mmP16Cpp
         2e6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731869176; x=1732473976;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZuAX6dOTq5fZ6dymYZ0ndr0pKOruoIR3MEVZ5soZmgs=;
        b=UyqKTjvxiAIdwCR7lxa4iKEPa0sCTlBUJ/K58J8p4OpMtt6BNWkEdsJVUUOjNlXd+u
         HnnAacBLguiBmFweQ0x2eihNKRmhgyMU5F1Fn2wKbapaUbboumjxryIJI3Lp7YUEh+Vg
         rUfP7eG+w2WGX1aMYv5KKOFPS2BlhValatFNUpRxK81d5c2lPzmsB8FOLVt7epMmIVzy
         R3vQLl6rvsTWtQiSySUgO+CjM+zQRLGnn7XZBQyEOD1KkF4OGkI+xZNot1uzipZGHkvJ
         Wv1/7IBu8NBdRf0iaEQG93CK18I228H8QccVrSWCZTXOq3b8Th/qsmoOxu2j49kqNQrT
         B/qA==
X-Forwarded-Encrypted: i=1; AJvYcCV1egk1ZCnzd6QpbNo22UupCjgOLKgQGMtbyD+yLyyf/4UE4ZDtUC83fOr/7cOtq2VRpOoKGL2godmKUcPROpFf@lists.infradead.org, AJvYcCWroiqhh/a+GaBAd5EaI5KyOfcRtBDSHjT6/jJF+lruXj+unjaVbybRzmKL2sw5gKP8OTl7ZWP8HvyxwA80238=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuWc3cy70awEhOm31yImZc89Mhw37z4TFn7awN1KEzCItXtYEr
	hwiKc/htsHE7030EkoBK5X7dbAUpRNOqtd+B+6a+b3IrgjV5r93Z
X-Google-Smtp-Source: AGHT+IGQj4MiLznYLc0yMzzGSNQmSxfcskkmVqpy895pf8twonga5yhG5Pxm846pldgya1JFpJXFKQ==
X-Received: by 2002:a5d:64c8:0:b0:382:2ba9:9d65 with SMTP id ffacd0b85a97d-3822ba9a39cmr6003722f8f.31.1731869175639;
        Sun, 17 Nov 2024 10:46:15 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da28ba80sm132793025e9.29.2024.11.17.10.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 10:46:15 -0800 (PST)
Message-ID: <647d9131137670859619e47fbfc524158999a9f9.camel@gmail.com>
Subject: Re: [PATCH 5/5] scsi: ufs: pltfrm: Dellocate HBA during
 ufshcd_pltfrm_remove()
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
Date: Sun, 17 Nov 2024 19:46:02 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-5-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-5-45ad8b62f02e@linaro.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_104617_513575_143E0354 
X-CRM114-Status: UNSURE (   4.25  )
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



Reviewed-by: Bean Huo <beanhuo@micron.com>

