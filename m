Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC39CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 05:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3pn4cuUfFSRyvhCaBTSBtnyydB0uD7dBx1ds5nx5l4=; b=DSUlkjOwluKnVIcWLlm4Iotv0L
	xT6pqW3YbpgoqLXIKgJdATHFSdmYtRWMbO/cfK3mmLV1e3qifrjtoNHLKaBnuqvUgJZqNwTbab9wr
	6zySlgqbZykLDVbRk91wZGTX2lPNhfc92wt01sxpnSOd0xKWvwtFFUcAxcBXoB+xXA2f/uFDWq4tm
	oMYQdZDm7SLWEgMcIORcBo9+ZHGGaps8NIirvJDUBoZw3O1wuVZn9Gz8HYPFXDDQMRx9f2+HnYUkc
	VJCoEFREdEiAyh49LzL/O7/cmbBLfR/YX9lqSj8PJrKLjbjNOUiVqlPU6ct0wjpPQUdIdtXr/5UDd
	NcH05lgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTYUl-00000009FTp-3fhQ;
	Sun, 31 May 2026 05:13:55 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTYUj-00000009FTU-36nk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 05:13:55 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-304b8ced372so6479678eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 22:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780204433; x=1780809233; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3pn4cuUfFSRyvhCaBTSBtnyydB0uD7dBx1ds5nx5l4=;
        b=RycyRWpiCigQujrcvEuyveSLKH7NfByFtE+rVUwD2hUhMcAewwY0yaDhGQzIk2biYh
         BNOg5HRSr6woWsOzG2MUXmPpj47YOU6Y0Av/K1kE/U9bCrGAGqajmhjkulO4kCwFLvGL
         c5wGRV96TiOrKih5EKooNGgSfEWK1orBiZNqoRPCVbzkaWB1kv/pT/ZWhZOsj2W4PBTT
         t4VdPh6cyMOriTpfWgv4YWJcyf4ummkdsGmHhOqq2h8BH+MgMFKemu7scbKMVlgTJqUY
         VflfS+oqaAdOjch5v+GCR2bpT6cp9ScpkkIK+DVVnhGarbLwVWDLZHOitalNVoMImsvQ
         +Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780204433; x=1780809233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3pn4cuUfFSRyvhCaBTSBtnyydB0uD7dBx1ds5nx5l4=;
        b=qgx3k7bCu6hWh8uTkyzs4jP0nUa308UKyiJiTbBaOQ97RDCOFcl5Zii1zTdi31MIAq
         30Do8b/0eUPMJkgr91Z/yCJGuppvBO8AZX5xEhi2CjSqqPjmmDe0w5JfhbESMVMvXvLe
         /O8RNTVFKgpjcArUprJJJe0aZjf1Rqm0T+BVXTCq/Iis0yI3wkbn/qrqcGPNv9zUxYIY
         nLMNF+L1OorWh+xCQn/9ZaWzVMsJ+B2NgmFoifvKhJR3Zwk1Nnb/Hciy2ftbcrrCOdWH
         CIv65qbcFi2eSXgR3f9NGa0DCTQGUi9HMnaPDODE3WQbDwLuWwdjiOs/ppcm1Tlx9abb
         2ZiA==
X-Forwarded-Encrypted: i=1; AFNElJ/sWlysNhXAW+onrY1ezPJnuEILRMAf6btXxrdafLE63QQ5aB3pNYdua+IZ/zffrEV7PJAO8Qp4M6FJ6JvNcsbq@lists.infradead.org
X-Gm-Message-State: AOJu0YydH+EYUOuZTBYw/Ktph/zGkdj/HqEHBxKep9ZP/9s2G6UQuN3D
	pGTA3W+a0bLDCqJe0wQCmma6uhIFbaVFTU71gU4StZgiWDW1I9UTvUtD
X-Gm-Gg: Acq92OGdrxliYNj/GxCwuPLPWi/HKybCGUHdtE9cLWDlWDzh18/jLskxHA/IM6rSWYQ
	TamOv/6WjDxDpuM/uNtzBqw/wM69ZyQjzkkta9tP1KU8SatGlm8BBlKwXhJs50F7KSyOLR+FXwZ
	y4/lnEOeVl7PvUAVWiTqo2fgpKSnpoREHWDzDyomuiL3IcglWO6uer8/WUATdPJ3zCDhznguyVK
	AXP9TITGAvPGUCc0ST66IU0QFO4mHtkEUiy5bofBwH6NvzqMX6kzQFlACzuw1YUTGcppeb25Eud
	h+9jgXnmQkOo471V9kj2ru6iJufsamq5c2dDcx2rZSugubCs40coYTD+L5xL1nbGy1mZAHVPcTL
	2yRWEdFMY+DNeNvecrpOT9Nz1Hiq60uhxyf9LPDbxVLrClD4ArksU3Sg+GNcoUmVTT90b0ERnI6
	MfDv9PCeX+XKmigxP9t+Qjakvl4+1kCj9Jj62ydD+csOnyoLnvVJ1QpNSainksO2y/pmCXCRVvk
	Q==
X-Received: by 2002:a05:693c:300c:b0:2d9:5cd9:b8ff with SMTP id 5a478bee46e88-304fa4a757dmr2802692eec.6.1780204432587;
        Sat, 30 May 2026 22:13:52 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:aa7b:13a9:ea74:503])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c3121sm5667940eec.5.2026.05.30.22.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:13:51 -0700 (PDT)
Date: Sat, 30 May 2026 22:13:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Anshul Dalal <anshulusr@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	Linus Walleij <linusw@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>, 
	Job Noorman <job@noorman.info>, Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kees Cook <kees@kernel.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Yauhen Kharuzhy <jekhor@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Minseong Kim <ii4gsp@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Oleh Kuzhylnyi <kuzhylol@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Josua Mayer <josua@solid-run.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, David Heidelberg <david@ixit.cz>, 
	Petr Hodina <petr.hodina@protonmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
Message-ID: <ahvDNu0TQKtjvmSk@google.com>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <ahp7WuHiPYa7Q_pX@google.com>
 <ahrP4STTFdUsBp0O@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahrP4STTFdUsBp0O@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_221353_785206_860D9E21 
X-CRM114-Status: GOOD (  21.54  )
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

On Sat, May 30, 2026 at 02:02:20PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello Dmitry,
> 
> On Fri, May 29, 2026 at 10:56:48PM -0700, Dmitry Torokhov wrote:
> > I like the ability to properly set up pointers for driver data, however
> > I do not think we should use named initializers for name field. As long
> > as we are not planning on moving its position I like the brevity of just
> > saying
> > 
> > 	{ "ili210x", .driver_data_ptr = &ili210x_chip },
> > 
> > Can we keep the old style for the name field?
> 
> I have no strong opinion here, my patch introduces the named initializer
> for both members for consistency. Note that my patches for all the other
> subsystems (and also other *_device_id) do the same and you're the first
> maintainer with that expressed preference.
> 
> I even sent a few patches that adapt initializers without .driver_data
> (e.g.
> https://lore.kernel.org/all/177932943265.3832404.360063047381979287.git-patchwork-notify@kernel.org/)
> that got positive feedback so far.
> 
> So if you're ok with having input differ in style from (up to now) all
> other subsystems, I can rework the patch.

OK, I guess I am too late to voice my opinion. I do not want to have
different style, in this particular case at least, so I applied the
patch.

Thanks.

-- 
Dmitry

