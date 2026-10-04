Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56BECA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 07:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPhnCbH5nfK+KOXs9ChJxFjkxzJXKQLtLRJEkaP4nBU=; b=aZP9fFvtB19XJ+pmfsBFgUnnz6
	BaRAsLmFsjdLVX/xbtKWWy0GQwLlVowg1ABm7V5EMghiEaJVwL/ejhgdLWllmuESS34KuzMhO1Upb
	lH582ySjMpdfnzxILWHu3Lxzd2X6UOhB62TCMhg+wXnrmpn0hfZpMy5oqhhvUamw8w2z2EmvoeyTI
	ztKicJj71XifH0S8po04boMRRhNRVZCPp1zAfZ69y2glD1UvnRQbq79jZC4e3WEWur66AJQoWl6Fk
	EQFYYRDpAp4wK/2wcr8b6cMeTGAPSGLrUHpXZB+4t9lR48zeJoS57O5mW0v9aTloonJIYXxP3o6hg
	w9SSQ+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDH1A-0000000EUj6-2LSD;
	Sun, 04 Oct 2026 07:52:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDH19-0000000EUir-3TWC;
	Sun, 04 Oct 2026 07:52:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FFB4416BF;
	Sun,  4 Oct 2026 07:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56541F000FF;
	Sun,  4 Oct 2026 07:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791100338;
	bh=HPhnCbH5nfK+KOXs9ChJxFjkxzJXKQLtLRJEkaP4nBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l6LwYv+EDwQI+sAFvT/invRE8QA+hGh7IMbXyDd8hw2rQgbgu2UrKb4X4YbP+HHW8
	 fbNguDncoz3kP7B+cD7+GE8T49++d80Q4Qff0Dkd7RfghulrYer12hDyEas8Rg/VdH
	 FNhaIB995odCh0F2EKowN718JQjj/L6FesfyDg/PbKFQPapeZHV5Lwi6ORwBh6N3x/
	 iJmg3H4ltUSNdT+anEsp4p1JW6dZkyl2YoNsYgD/T9b6bEUci0Hyb1PV4HMmQ2LXx1
	 WemuxvwVKjx0S9300PG6Ukodhrm1bM0gdzlJh1T57FNf/v5lAdx9QFCC8BZsAqm1B3
	 Xkk3FC2KtbfNA==
Date: Sun, 4 Oct 2026 09:52:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Allen Lin <allencl_lin@hotmail.com>, 
	Tylor Yang <tylor_yang@himax.corp-partner.google.com>, Felix Kaechele <felix@kaechele.ca>, 
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 3/6] HID: himax: Add DRM panel follower support
Message-ID: <20261004-walrus-of-angelic-performance-5f09d0@quoll>
References: <20261003142741.48634-1-michal@nozomi.space>
 <20261003142741.48634-4-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261003142741.48634-4-michal@nozomi.space>
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

On Sat, Oct 03, 2026 at 04:27:38PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> +/**
> + * himax_resume_proc() - Chip resume procedure of touch screen
> + * @ts: Himax touch screen data
> + *
> + * This function is used to resume the touch screen. It will call the
> + * himax_ap_notify_fw_suspend() to notify the FW of AP resume status.
> + *
> + * Return: None
> + */
> +static void himax_resume_proc(struct himax_ts_data *ts)
> +{
> +	himax_ap_notify_fw_suspend(ts, false);
> +}
> +
> +/**
> + * himax_chip_suspend() - Suspend the touch screen

Why are you explaining standard PM functions? Not only with comments,
but with kerneldoc?

> + * @ts: Himax touch screen data
> + *
> + * This function is used to suspend the touch screen. It will disable the
> + * interrupt and set the reset pin to activate state. Remove the HID at
> + * the end, to prevent stuck finger when resume.

Only the last sentence is relevant, all others just repeat the code. We
can read the code, no need to say what the code is doing. You should
explain WHY, not WHAT.

> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int himax_chip_suspend(struct himax_ts_data *ts)
> +{
> +	himax_int_enable(ts, false);
> +	gpiod_set_value(ts->pdata.gpiod_rst, 1);
> +	himax_power_set(ts, false);
> +	himax_hid_remove(ts);
> +
> +	return 0;
> +}

Please take over the series and clean it up from all these vendor kernel
monstrosities.

Best regards,
Krzysztof


