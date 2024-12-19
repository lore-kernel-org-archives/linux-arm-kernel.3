Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85260E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k232UiDWZ9i334Ovjw0KByCgbnjokcMOWAtrXY0DoWA=; b=i/WWTQhNZCumkhw8b1Hgexcrls
	DKEul9QKne22cFqVJy/DCfiGTj3NGvt91zZxgk+tR7mQ62/Cavt0wgnK/X3Sp2u7VeQbR3TpQhWpp
	eOzOi5ix2Tq5l0UztQEQmB6ihipRbm6AUnOMMfZNse87YGXKSpfI2/EUisvNvJ/217UaHhrHUMqOe
	AmeSV+nXxiUmIkJ1TWsN8GByPbzrMcpsY42NkaeEMDQVu3v7sqZEG8LceZWDVaY4duX6DBNkAbj4f
	LivynxG4g9TOvGVfdAZv6yO6U4j/9zCaggvR2awELYt0d+HM7GAop5diPc6JJNJztlz/eIbo6GPId
	X9+pcl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEVD-00000001dFi-3rfF;
	Thu, 19 Dec 2024 11:15:35 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEU8-00000001d8h-1Nm4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 11:14:29 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa67ac42819so98892266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734606866; x=1735211666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k232UiDWZ9i334Ovjw0KByCgbnjokcMOWAtrXY0DoWA=;
        b=W3h5oji9ZLQLfdwyaAKaEdAi4W8XX2bif5JrxmFYUSbsdeH475dCryOiCQPiFrpGBn
         zBftai5nrSv0IEeQ1LVcsaHbrLQt7oK6bebJ7O0jBlogeAlPvGpNK8BqUDiKo77XNRpc
         3N81KkdKPSgiIkzgUaUkh1hyOkdpi4zSa8Qml0MpngD4LkPZ5CL6CXZ2wTy+3k5+SdBT
         WsRJaCZPl6G/HFJ8n4EkY/W2ScsQ9/Y1+eRzymBLhV1HDj4BuAyw+85kZu8neKBkogxk
         s/4B1dknAt/Wf6VUloY3SNfUTw4aV3bH6e8Qteu223d82BaKHBXrM4US437eJVjOK5DM
         femA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734606866; x=1735211666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k232UiDWZ9i334Ovjw0KByCgbnjokcMOWAtrXY0DoWA=;
        b=c1d0Zib9JS1bxwVl7GsDX6bWqntdy6QlQ1wyWxagILacIwdCM19HB6r9wx8w/Av/Ux
         cMNZMfqYRmTnFiTkKtlCQ+zeDkoGtfiijdJOBYTRfjVfaO/QM/FYmJw2a8ouCYcfcX2q
         WqfqBAw7JVCfoNiejq2eWkcsB7ylR2svLTAgJAzLuEg4MwRRSAuw00OaXV1TSdiAecj5
         Uq1a3jmB8b87hOmRqZNJQWqGsFRbfvhOZWTb4SCcNM71XqIvSObrfdkqs51g81cpibsF
         NHGd+/BtNSUqOY/jqRAuQODXqrCh/TB9F6p9jDh9WrNQcbQMw81g9+pUteXzdwhWGxy3
         Bd0g==
X-Forwarded-Encrypted: i=1; AJvYcCUiomMKQkxu5UnwZ+poH5rYwhnS4zRBjOC50YZxqCQi0C2vxnuVwAEU6itKXC9iUAkBWv1UUKcFQyT9bRAvoQTn@lists.infradead.org
X-Gm-Message-State: AOJu0YyTBAlvlNQGG1JE2XfbGUvX0PDNGwNgCRTyuVXdHtU4/9hqCTYM
	gB+DU1pmDxdEra37ssHGAE7dkY/cFxsP0uwYoRjuKePmRAE8LBtWTnELbj7VgQ==
X-Gm-Gg: ASbGncsHssE5Lye5PhV4gOW/RGcU8oQIX8fMLur2OLsYBjkSNAUI5U5kfFvXq7behkr
	1o8eZ2akZQRfrnXd81JpLtwEM2l00CiHjWeIkWEUkH5aHKQYyBMIzh9/pyG7NH7QNMN0S8U44A8
	aUwTS8BB1XRRYRXE97QRXNYvTYaPnx7faXzQb9cm6WWRSMgXGwAaNdhTc9YtglURpUNzsg1cnkx
	mF/u02SN6n6qwVsFfE3ZTkRc+VJLi7dTbw/JDAIHhJCjLbwdnnbKeJAivExKt15ta/qh+xVjEXY
	AGY/iaW0Y4dhMu4=
X-Google-Smtp-Source: AGHT+IHKoh5EsN1uLkOfWMRdI2tQtHhYwKploXkp4V8soZqdefYj8PoGPzqWp1FX9+8rm326OJSgBg==
X-Received: by 2002:a17:907:1c90:b0:aa6:85d0:1486 with SMTP id a640c23a62f3a-aabf496eb16mr518756966b.54.1734606866353;
        Thu, 19 Dec 2024 03:14:26 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8954adsm55343466b.64.2024.12.19.03.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:14:26 -0800 (PST)
Date: Thu, 19 Dec 2024 11:14:23 +0000
From: Quentin Perret <qperret@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, vdonnefort@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 11/58] KVM: arm64: pkvm: Add pkvm_udelay()
Message-ID: <Z2QADxbdoYi5q9iT@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-12-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212180423.1578358-12-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_031428_367776_FE234D46 
X-CRM114-Status: GOOD (  14.56  )
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

On Thursday 12 Dec 2024 at 18:03:35 (+0000), Mostafa Saleh wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Add a simple delay loop for drivers.
> 
> This could use more work. It should be possible to insert a wfe and save
> power, but I haven't studied whether it is safe to do so with the host
> in control of the event stream. The SMMU driver will use wfe anyway for
> frequent waits (provided the implementation can send command queue
> events).

Mooh, I'm thoroughly hating that we need this -- pKVM is non preemptible
so we better not wait for too long.

I can surely figure it out from the following patches, but could you
please expand on the use-case?

On a side note I'm not too worried about the power impact of not having
a wfe in there, again we better not be spinning for long enough that
power starts to be noticeable.

