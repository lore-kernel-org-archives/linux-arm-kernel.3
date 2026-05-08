Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E6ACD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 20:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYQhrTlIzdCXJRNGCpKZc0uS+MwI2bptTg0r3gmq+RE=; b=3L0HxiO5LDTy4oBI5SlL6CtSyv
	WGZL6hnwWt44fS+lVIxX24wS1Ke/dWREdE2MpUaxyKLehfQHklOkJYlffP7ZH1gPjfsfUQJmKy1eD
	m1xmrkV1sl2DCzPJYihkUBpuTdqGU59sy1x5r+BZYi7gifdEREzvDp+H/DDRXBLF4QHhd28zb1pIr
	VaZlaGd3wmQ40VU0PXS/Ev8US/Gg/Edy9VDMPeL+P71vqNBUPZWgd/oN88X9lhxNuvbIR5vUS9/mC
	wpvO1hd8lm0iSb3PYNoAGo2mAZdYfSjJgIBKltI6D4Y9FsY9VMZEWW9OA5JPP3hHF/zsyg435kHQq
	VYx9XJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRNy-00000007PcD-00kY;
	Fri, 08 May 2026 20:01:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRNt-00000007Pai-36vr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 20:01:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4832c8f9d87so2565295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 13:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778270475; x=1778875275; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sYQhrTlIzdCXJRNGCpKZc0uS+MwI2bptTg0r3gmq+RE=;
        b=O/skpzuWhAwd3KsZn0pMpx1aPGnwOcC+ofWoePE9WTWihAj06ajQ5/aDoJCPkpp3k8
         RkcbkrFarkdb9jTyj3HNrqj1nyjnrsSDxT4TT8a/s9J4LxRqIjWqK98pZ4ZD+CrIvY0B
         JsBxMAPtCpRkZ6CDqK7pKIvaArTjYQPNOB4ayvBOnZCh0vcqrS04h+RekQGvD9g/CYFl
         OS5FvgcJRHoqMjEOZEsU3KYjl46ejGp94YoIbhAYwZ1JwyMcjtUvTukRHKREJcOcLQKp
         FiYs2MfenLZ38in4jRk5EHhH8eRAt5xhOS6ylmCfmvFn3J4zUxBWJqy97jeUguFzqx2g
         7MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778270475; x=1778875275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYQhrTlIzdCXJRNGCpKZc0uS+MwI2bptTg0r3gmq+RE=;
        b=DITtdwiM++nVLl2DH4oQ9zE8Hhrj0VeDFdg2Vl/+vab6HV7kZOAyzJwwhnG/Va2192
         AqKXNAocP4OAAXrcnwKLiz8Gk4OFZYTJ1c8cF7jRzxWLlZ/7hsNWBJkhsskgCez3cqEo
         scBzu8Y0/rKtbborwBwqLImYdGVyOa+59KLILC9NdbfuBafEvboqbm//X+LrNNOTbzNA
         4UZ8mRDzZw4IW/FKmbqDY9PcUF6NuUYDqFLVeAgmPp/OCvAA5pAkyGSuqFgksC3tggi4
         yfB+to6InUrlQpEhVc9GQFI/d39WxjwgchHcNo3nMOCOy4qYk7p632t+5vfoNZLNpfXZ
         jg/A==
X-Forwarded-Encrypted: i=1; AFNElJ94atDTg8j6vqDtVxRErcuipIHQ/y8MwYOhGyitYE17EWjANrIqKHDMD2ODm2M4b3HJfsQYyDjatX7B1DahhhuA@lists.infradead.org
X-Gm-Message-State: AOJu0YzWW0wiAl9VDi8khA+Zex1yjBL3MVwWecXzZl3R5KY8r8OtuM2U
	keU00rfMOhAolPN+Swg4FgG5EZOIpOAcGU9tprMV2d70A4eCifOOPMV4
X-Gm-Gg: AeBDieuDmbG/3KCtspkJzPs5zLzvsMj1wrFuphpmW+Ao9N6MLG4NZ16uObHvqql4pA6
	06hVvTpVIrZy1hx43RuDafnJbSiNtD6JVQxD1UKgfbsyTH1rmQmyNKKN/JMzVMoToW0/aCFXuq0
	gCAHQLVN6m++VBxcrvQJncf2OYqRMi7tSlYn6A31X3JtjwSzSKP1tLkALAqwLCyuVocat315Rpm
	lTm244CKUgbQ7mh4USdAZA/2IR856UAfcIfGqX3Q125NgRrfgeFTpMhJ3W+3WV//DoHd0dVA0wB
	jNfjNAFtF52/4mLFsJcIhN/mvDgqdEmWDGmctJYe1FC1CTglA8HJd7MI1vbXKn/7mLMREAtDymd
	287tWFq7m8aLpkS16bBOqJ/k20ihxANQeMJZ8psKwmW3L68eZbbEbYASO0X3B4ZXmkTbQkYgLnD
	Vkreh1yrxB10hUXlU=
X-Received: by 2002:a05:600c:4755:b0:48a:5546:619e with SMTP id 5b1f17b1804b1-48e51f4534amr113202975e9.4.1778270474915;
        Fri, 08 May 2026 13:01:14 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d403:cf00:7892:5318:c552:d08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45492271510sm8325074f8f.37.2026.05.08.13.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:01:13 -0700 (PDT)
Date: Fri, 8 May 2026 23:01:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: David Carlier <devnexen@gmail.com>
Cc: sven@kernel.org, j@jannau.net, neal@gompa.dev, vkoul@kernel.org,
	neil.armstrong@linaro.org, marcan@marcan.st, p.zabel@pengutronix.de,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: apple: atc: Fix typec switch/mux leak on unbind
Message-ID: <20260508200111.kfl2a6u6gzacsvu4@skbuf>
References: <20260507163746.108086-1-devnexen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507163746.108086-1-devnexen@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_130117_821170_387D5812 
X-CRM114-Status: GOOD (  27.00  )
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

On Thu, May 07, 2026 at 05:37:46PM +0100, David Carlier wrote:
> atcphy_probe_switch() and atcphy_probe_mux() discard the pointers
> returned by typec_switch_register() and typec_mux_register(). The
> platform driver has no .remove callback, so when the driver unbinds
> (e.g. via sysfs unbind) neither typec_switch_unregister() nor
> typec_mux_unregister() is called. The framework reference taken in
> typec_switch_register() (device_initialize() + device_add() in
> drivers/usb/typec/mux.c) is therefore never dropped and the
> typec_switch_dev / typec_mux_dev objects stay live forever, with
> their sysfs entries under the typec_mux class also left behind. A
> subsequent rebind cannot recreate them with the same fwnode-derived
> name.
> 
> Save the registered handles and unregister them through
> devm_add_action_or_reset() so framework registration is torn down
> in step with the driver's other devm-managed state. While here,
> drop struct apple_atcphy::sw and ::mux: they were declared with the
> consumer-side types (typec_switch *, typec_mux *) instead of the
> provider-side types and were never assigned.
> 
> Scope of the fix
> ----------------
> This patch fixes the registration leak only. It does not close the
> use-after-free window that arises when a consumer that obtained a
> reference via fwnode_typec_switch_get() / fwnode_typec_mux_get()
> outlives the provider unbind: such consumers keep the underlying
> typec_switch_dev / typec_mux_dev alive past device_unregister(),
> and a later typec_switch_set() / typec_mux_set() still invokes the
> registered atcphy_sw_set() / atcphy_mux_set(), which dereferences
> the freed apple_atcphy through typec_{switch,mux}_get_drvdata().
> 
> On Apple Silicon the relevant consumers are the typec port and the
> cd321x controller registered by drivers/usb/typec/tipd/core.c.
> Cable plug / orientation events and alt-mode transitions trigger
> the .set callbacks via:
> 
>   tps6598x_interrupt()                 drivers/usb/typec/tipd/core.c
>     tps6598x_handle_plug_event()
>       tps6598x_connect()/_disconnect()
>         typec_set_orientation()        drivers/usb/typec/class.c
>           typec_switch_set(port->sw)   drivers/usb/typec/mux.c
>             atcphy_sw_set()            drivers/phy/apple/atc.c
> 
>   cd321x_update_work()                 drivers/usb/typec/tipd/core.c
>     cd321x_typec_update_mode()
>       typec_mux_set(cd321x->mux)       drivers/usb/typec/mux.c
>         atcphy_mux_set()               drivers/phy/apple/atc.c

Ok, so the claim from v1 that this patch fixes crashes from these
code paths is not correct, since there is nothing that would make the
typec port drop its references acquired via typec_switch_get() and
typec_mux_get().

> Closing that window requires framework support for invalidating
> consumer-held references on provider unbind. The same
> consumer-survives-provider pattern has been discussed for the PHY
> framework [1] and is out of scope here.
> 
> [1] https://lore.kernel.org/linux-phy/aZejMSJ9qqRWb2pX@google.com/
> 
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---

The commit message is much better. But there is a checkpatch issue which
appears to be valid, see:

commit 931d5c36c7369b65adb9e3d197a8d3a8a913db8c
Author: Joe Perches <joe@perches.com>
Date:   Fri Jan 16 09:42:52 2026 -0800

    checkpatch: add an invalid patch separator test

    Some versions of tools that apply patches incorrectly allow lines that
    start with 3 dashes and have additional content on the same line.

    Checkpatch will now emit an ERROR on these lines and optionally convert
    those lines from dashes to equals with --fix.

    Link: https://lkml.kernel.org/r/6ec1ed08328340db42655287afd5fa4067316b11.camel@perches.com
    Signed-off-by: Joe Perches <joe@perches.com>
    Suggested-by: Ian Rogers <irogers@google.com>
    Cc: Andy Whitcroft <apw@canonical.com>
    Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
    Cc: Kuan-Wei Chiu <visitorckw@gmail.com>
    Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
    Cc: Namhyung kim <namhyung@kernel.org>
    Cc: Stehen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

I don't have such tooling (git am from version 2.43.0 applies the patch
without discarding the text beneath "Scope of the fix" just fine), but
the commit is from Jan 2026, so that tooling must still exist somewhere.
So please resent with different formatting somehow (either a space
before the title, or replace the ---- with ==== or ~~~~, whatever).

With that addressed, please add:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

