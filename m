Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F74FB3CEA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dw3GlJzRigow5MEAZRBZ9gfDU7AZvtgosUcNlmBiH4s=; b=mffjnsoaK/yQfoJaIgFbwEu9Hm
	vcGcwxfyEWa6LtNwWy+kocotHK+bGPQVWKcOW3XZcr93RFzo4VY4/H1uaA6uzpDRplb7a/2jEqS3g
	7SxlZUK3E8zQXQ+BkL2mqzenm55hia+W0cQdxuOIZMm1XgUjyalAkr1Tb8DBF8qf5muRfYTsdfQGQ
	w74jJtq+KFJrQsG2Iruu223RsuofEB/T1bYMHVapNsinTCbVNi6Tn6fHUxYXNUsidygUWiNUP/uOf
	WZ4Lj+ksfGMpjXBowIY1Y06jLs5ubHbqWeFFTXeOVE/cI79g4PczzUk1qiSPgT43LFLPXBGTi9Xvm
	L9asOfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w792N-0000000AyOX-2uHw;
	Mon, 30 Mar 2026 09:35:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w792K-0000000AyMt-3Vew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 09:35:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-486ff201041so41886435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 02:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863354; x=1775468154; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dw3GlJzRigow5MEAZRBZ9gfDU7AZvtgosUcNlmBiH4s=;
        b=FE75r7DMVJeP0tMLHVVQM7dUi9flDRYMPMLGDDMUFHQhVEVyYC6bKsDqxivFEGNaS+
         zbwz1R6Z4LgDiqg+hVQj9B4nB7sXypO10FhRPdd/9bRdxZMfKsEhUBVFp0kmn+zc1WQl
         ++JkaYI0q7LbdSWqAnYs2A//Oq1p41FTWqgqHyEpcrNbMee1WQCZiZr9DT3/mh4JETk8
         8T8F/TFOTnTRCSE3XMkFphs3KOx51U5KRor3f6pB1R30MshpCz1LfDbHnt0dTgptulHn
         43PJxZJLFvv54bD2T8GfRoLCAClqXyAudAmxFhxPdcKj/QewNVYhikmknBpzvIhHjgmQ
         6FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863354; x=1775468154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dw3GlJzRigow5MEAZRBZ9gfDU7AZvtgosUcNlmBiH4s=;
        b=RYKv+7CvfKIr2vuUOSNjVmupQdHMUC8ftSdfjc2GIkFy1koL1uET0UqWds3O3/eTI/
         LrfpSTsk3UJCK0h7wHIRFP486oK1XjKiArbSeAT4t6pIx+gILTSl9RJaLGoNL5/GHWbA
         eRwgMWQ4LDvOXdAcWkXGK3olE/5X/qW2+R+/K7kTFdz+wVME9yYqmD4xxe3AblMlHPao
         XLRhMbnHQyDacm36Qv6q/SCPAfMwo+wP/3jNaJsSjsVLg8ePfujSzCc34NVqfj56Wcng
         KyeXG5aimRsK75CrPDkh34jkUe85DTc/vH+OYrXRAZDw2xrTfIPXIbxyyl3ZXUdrdpOh
         rdtg==
X-Forwarded-Encrypted: i=1; AJvYcCVLYWrqo+9xuDlyLHqiKe+Ja6p9eaXEjPm83n49aV0ebR5KzyxsEmqOaXH2JqD5f6/KIcuWYONKkIfEbJNPKoH9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Rn8oUvcafduqJlV6XRSOe0qZ13TUgXTHrVf5cxnHsxXsnoKp
	bamJI4uCu3ti5InQNO+jf2NAVwV8xpKkt/drn15pW06WRrjVgDyOJ2sL
X-Gm-Gg: ATEYQzx+cN1Ub70L4u4SPxBKHwAOlLf53airx0LiJGf3vetZaDivOnjJjemSUgBNoMd
	6D9UQ21A1niwis2jj/KZkcDUWR2KGqmhx4QGXPrVxF4+PmF/VgF/GFx1vVDD1asOF0U04S5jzMI
	ECPpRrfRllDfMeQei4V4kNEmkaVJJPay4SFTSCDUS/4kvNz71aeBpQjljby6IDcYdM10+WgLZlC
	Qg5Pk45RiWv224WhgV7h5zuZppsoR0o7V5L5+P9UTWXP7O6/Z8x8K3j9az8qdOB+3491sTR4URt
	Ms1Y3cN+l03mYLClN2SLiQ/M8ICSgLTjEmqWBMZkewhYuZCmFN/p065Dc2WVTaIzvI+Dk3AqGnU
	yyaTYRBlp3S7fpGueohYRs5VPnWW7RpBMwIYhAzfq2gRMmOOF3sx3yZDSiMHTmePxwZfPGQvXOw
	67tv22rM1i7z48sqDIIAY=
X-Received: by 2002:a05:600c:c87:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-48727ede17amr203752735e9.23.1774863354250;
        Mon, 30 Mar 2026 02:35:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26884641f8f.0.2026.03.30.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:53 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] staging: vc04_services: vchiq-mmal: validate
 component index in event_to_host_cb()
Message-ID: <acovDyj3L4ORCn-H@stanley.mountain>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
 <20260329071616.507876-2-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329071616.507876-2-sebasjosue84@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_023556_910860_C7F15968 
X-CRM114-Status: GOOD (  14.98  )
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

On Sun, Mar 29, 2026 at 01:15:39AM -0600, Sebastian Josue Alba Vives wrote:
> From: Sebastián Alba Vives <sebasjosue84@gmail.com>
> 
> event_to_host_cb() uses msg->u.event_to_host.client_component as an
> index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
> = 64) without bounds validation. While the kernel generally trusts the
> hardware it is bound to, a bounds check here hardens the driver against
> potential firmware bugs that could otherwise cause an uncontrolled
> out-of-bounds array access and kernel crash.
> 
> Add a bounds check on comp_idx before using it as an array index and
> move the component pointer assignment after the validation. Use
> pr_err_ratelimited() to avoid log flooding. Note: this file does not
> currently have access to a struct device, so dev_err() is not available.
> 
> Cc: stable@vger.kernel.org
> Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")

This fixes tag is wrong.  That patch just moves code around.

I can't apply this patch to linux-next.  Is this another out of tree
bug?

regards,
dan carpenter


