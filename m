Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE59FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4B/xQ2Yak+fpxIrk/GyFx/NQxbFsrazzrnNpKayLw2k=; b=PjzCU1h5tfkOwH3vYiKPpgkWqR
	82ki+pKKotr6ATnYVwgaVq25aCsZ2RrCGsFuOKdqcHuYk7VMnjPTsAPsFt8I7Bo3eeIiATSBqK14Q
	R95I8nFyOorXTZc1A/y5CnJNCiQRWCcyvv0XRWKyt5giNLzWYqYAOe/MzjydieqD2R+cvRQp+Q3BN
	R/N0tdatBaxGeR9VBzzX/bAuIsrnNOb7TP5eAT2tVF2KnJSEYEyO4tiYHzVMo998EkV168lyuy8WQ
	P52ubZYHMndQQcKs7ruJG0El8avdwoZgRjkaA+a5xmRxio8fkvgCQwJdBr9etjc9aVkWrxcgIKkAK
	TwexPhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyxN-0000000B85Q-1E0n;
	Wed, 15 Jan 2025 08:40:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyw7-0000000B7rR-2eeY;
	Wed, 15 Jan 2025 08:39:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso45770965e9.0;
        Wed, 15 Jan 2025 00:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736930378; x=1737535178; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4B/xQ2Yak+fpxIrk/GyFx/NQxbFsrazzrnNpKayLw2k=;
        b=c7Oht+b2JEy/DUD7ulZcwmLraFd+a7jPR1M5/qe/1X+snoyDzFYzQdheZoD3j0fkrx
         6QD0KhX57O/WV2W+sZnoQVI9ExegCqeFn+TXPZIJVF+Zxts/Zpj6LXurptRlC2K4spic
         wy0/GpePMtOov8TZlW6mxVd2bBm+z5fOz0TdfGhc7jLUvU744pl63dn+TFgdc15laml9
         hGSgubGGV1mb0IxlgYviBZOa65HxidM21deFTJdmusedYL7bird3EO/5lIXRrQ1/lX6A
         jkJMGUtWt69r4sD8p5UOHDcSHF9YogkhLoFcCQd+x9ZWptZVUk/YmD2M56uRStoTL8en
         GcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930378; x=1737535178;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4B/xQ2Yak+fpxIrk/GyFx/NQxbFsrazzrnNpKayLw2k=;
        b=mZ+woCjFX0Eh7n9i476tfkmZ6gUbRtizcUAoe2O7P57fpWjSISNFaDOkm60IhCVdVw
         OLhyIcRXtNrmR3qmEkSgGqW6PWMvo7o+BTAIlbvvzLBUcV5km8C0MF45oP+bj2HAyOOJ
         PoDY423fe3/tZLZBCm9+fioWSFjuwDaGu00h0Fl/i4I+NB0avfJU+gzr7aCHSlTocFPZ
         pQ3dno0IEfxUnyUKF2cvwUWgkNwQvEktTqfO4nCk12PTAlsJIJtEkNMJfVf3qbWpoQG2
         4smMqGw6GMDJ+RL5GEDE3qpC4FaTMPfXQAZ6fkdmw07Ivn31YHezqixfasgeIZFqWwun
         zh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDZbhvkwamEnl94N8Irz9UpNmF4hA4u6OveRziIaU6tH5/kYAio3lPQ50/nxy1DHgTDgfNKhLNT3I+F+okFpdx@lists.infradead.org
X-Gm-Message-State: AOJu0YzlvEvCM/JAeH7xr+5eFShMlw9ATzOu0UmPYaJodbWyyFECB1wU
	xbmeyxzjAH7X4vLYHPd8px1WLzhaeVyWXCvHBCAUC8f7QF5XByBw
X-Gm-Gg: ASbGncv0Dr4x4+toa/RAGixmng4sle1U+6PjHTgLcmbr4G2udau2u9ygIZ6+2hWgDLu
	nq0lDZGZO0BdX70FYhAb3/l3QW3Vr9s+W+o0RQXJxBdrVr4vTap3t97B6frYkHFRkk4sYyLzbhG
	JzA/WBts4f28Pl6XOySTIiPDkOcyxeXsp0oerKqBteBDSeS7DBVl8yvYUNzUYgujtUgCqNjIeB3
	nxKNPpcv/kmWJBc1fW5nm/tDy/rxTVgivBOaVyUnaKG2Sd2K3L+eO1qgHLsDyKa7S4bYRgJ9qZl
	wVj+FrrUVTNt
X-Google-Smtp-Source: AGHT+IH1S/ypLo4sxdULxIVj7iio6j8QLiJZhFQomKltaJf5Ym2Wv7jn92KqFeZHfzoy72Wy7rxhkg==
X-Received: by 2002:a05:6000:709:b0:38a:41c9:8544 with SMTP id ffacd0b85a97d-38a87336a6amr23435760f8f.37.1736930377805;
        Wed, 15 Jan 2025 00:39:37 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b81d7sm17016684f8f.73.2025.01.15.00.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:39:37 -0800 (PST)
Message-ID: <67877449.df0a0220.cdd29.8807@mx.google.com>
X-Google-Original-Message-ID: <Z4d0RkjDxhtw_655@Ansuel-XPS.>
Date: Wed, 15 Jan 2025 09:39:34 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mmc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>, upstream@airoha.com,
	Chaotian Jing <chaotian.jing@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Add eMMC for AN7581
References: <20250115073026.31552-1-ansuelsmth@gmail.com>
 <173693027082.3240418.16772447316188600820.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173693027082.3240418.16772447316188600820.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_003939_668195_2E77861D 
X-CRM114-Status: GOOD (  24.79  )
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

On Wed, Jan 15, 2025 at 02:37:50AM -0600, Rob Herring (Arm) wrote:
> 
> On Wed, 15 Jan 2025 08:29:50 +0100, Christian Marangi wrote:
> > Document eMMC compatible for AN7581. This eMMC controller doesn't have
> > regulator exposed to the system and have a single clock only for source
> > clock and only default pintctrl.
> > 
> > Rework the schema to permit these new requirements and make supply
> > optional only for airoha,an7581-mmc compatible.
> > 
> > Also provide an example for airoha,an7581-mmc.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > This depends on patch merged in clk-next
> > bfe257f9780d8f77045a7da6ec959ee0659d2f98
> > 
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 64 +++++++++++++++++--
> >  1 file changed, 58 insertions(+), 6 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/mmc/mtk-sd.example.dts:104.31-32 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/mmc/mtk-sd.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250115073026.31552-1-ansuelsmth@gmail.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>

Hi Rob, I think this fails as the CLK define is still not merged as said
this patch depends on bfe257f9780d8f77045a7da6ec959ee0659d2f98.

Any hint how to make your bot work with that?

-- 
	Ansuel

