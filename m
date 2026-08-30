Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA14C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XP6R+Yg+TylQAhNN5dmgVZmEbDD+yZGA34fZK8IL/Io=; b=gTeG6KxJ2N4XS9VsM1iiuQSwhX
	zWZUR2v6OkkWTkwv96kNDMCzm+7+LmheUY7EuHSqTUWJOq9nEnZrP2kIWqed3G+VcyXkUYev45lLH
	/fZOvHSHh3juORG91tf0RNxotnmnDWvdAbfA/kJ60auj1f7yFxfA1GOwjT9K1PxMCp1oAIf2EjEe9
	N2FA9wswoCWVIbZWnrF25v8DhEUXe3XJ12Jrrm2oAgO0stqpOTMDbbLPP7coJlOwaAYmIVIIMunPx
	Tqe2JTaNnbdjgTCE3Q0MNwwxhXlLTO1UP8zBc+SbAMrNVfhsgcq85zi3QaHosJ/3qVYHzr+2t3lZW
	9Z17RoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0lzh-000000082iC-3Qx6;
	Sun, 30 Aug 2026 20:19:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0lza-000000082hO-19Qu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C5EA43D62;
	Sun, 30 Aug 2026 20:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CD81F00A3D;
	Sun, 30 Aug 2026 20:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788121141;
	bh=XP6R+Yg+TylQAhNN5dmgVZmEbDD+yZGA34fZK8IL/Io=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Z6ZxWmC2KkqG7A0dVLqQUsl8z3mm+WXxPR3/3wQE/BxlIbFnWrfukx67oitOwLKNs
	 IQUsGq8huaim+uTMusDju5gceIk+X+dS5XznVvCdXSW6baJSooOtvwvtHeydGMc2qp
	 V6+QSIodLoiXdLn0VTQGvt9haZhz8UnU9ErHKGeH97x5a7H0oZwkSpU3rgG/4oQ0Yx
	 JOGb+4PNekObw8kQw+PNmv1Fu1tuIrpNpCuxI4/cJ1nNfVLvED2OXObxzLWxSJM6B9
	 HruoBA+X5mYeuGP7Re3SVR2VTtBmBJtS9ZLd+OfFdUAgi0uDTijzYWSCO0W/OCDyRV
	 uIOABwnqvCXqQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/5] iio: adc: bcm_iproc_adc: use
 devm_iio_device_register()
From: Jonathan Cameron <jic23@kernel.org>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260830170919.470974-6-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
 <20260830170919.470974-6-mdshahid03@gmail.com>
Date: Sun, 30 Aug 2026 21:18:41 +0100
Message-Id: <178812112192.2788519.6653263616832987105.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=698;
 i=jonathan.cameron@oss.qualcomm.com; h=from:subject:message-id;
 bh=xisk9zcl4kv5FCPRU2cH6ngVuGMmImULxeXWsFd1Z6g=;
 b=owEBfwKA/ZANAwAKAVSFNJnE9BaIAcsmYgBqlJAzL2T5/XDB3W+cqFxgEnJA44XHe8dJgIDlN
 BePdJ43M+uJAkUEAAEKAC8WIQRuKWazh4QGUpEmgbFUhTSZxPQWiAUCapSQMxEcamljMjNAa2Vy
 bmVsLm9yZwAKCRBUhTSZxPQWiAiVD/48XgFuZYiVviyFyM/YM2XzGouEBjYl12jdegstbH3HT7F
 eOXdpSAp1/amy71dwjgpoC3COuUe5kteOOafoBaJpTVfmGZ/te7VSvFT4UfZY/kE/YOMP8kcVX0
 JfPCAFITtmMpeCHRDulRyruRDJrYlBVFgADaJ0TJut7Uc8s6t+Dci4nwh366SsnVEncXU74kr9d
 BNgsIu5YFIIfUE+UUp3iQ1DYCnELpbGRJz+RGX0BsidSl1iHHHsAxJuBl/Bo64Nyb+njP0eypss
 jSfa1F+quWUP7331ERJhlW4f0d3OMCvkt2y8aM26Fs3Lp7c69Xk8n9lLb+z7faRL0V8hIhMVqTl
 PT25Zzr1Cs1L89r3c/rpgZ93oOrHbKbrqjE2bXsaqS8kQhsvy9UhUWfhZ8J2d+wmxob4qVyPNxJ
 ZS3fHYioLRFCFlkg8XNo14T893u5N2cttx9aiPGV5+8UeHE3fYPJ4M1KqXh3JxlAzD1HIRozD51
 PHnBOAJNSLLrYl3sj1frPKwnmiy2FhJWACfAn1BJaP5PbmkkYp1Iux5OoS97cCQrNCByvW0llMk
 W+qv2Tocl2ZdN8vRyCSuwr9nzXnOMcUmeLUh3RUYeFKP3bIvdlDB+Kyz/bK/U6TOqxSEyGKZb/H
 4xOrXkAKidX7JeJbHqtiEbWi5NFzRtLYjTHmB8w==
X-Developer-Key: i=jonathan.cameron@oss.qualcomm.com; a=openpgp;
 fpr=6E2966B387840652912681B154853499C4F41688
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

> Use `devm_iio_device_register()` to automatically unregister the IIO
> device when the device is detached.
> 
> This removes the manual `iio_device_unregister()` call and makes the
> `iproc_adc_remove()` callback unnecessary.
Why is the quoting here useful but not in the previous patch?

I'd rather no ` unless there is some ambiguitiy wrt to free form
text vs references to specific types etc.  That doesn't happen for
function names as () is clear enough.

If nothing else comes up, I'll probably just tidy this up whilst applying.

Letting this series sit on list until it gets a few more eyes on it.

Thanks,

J

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

