Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF37D2503F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBaom7v74+gHXWd7YrxJuL0o3qS56NROqcnQWMlUGCM=; b=LkVAuPbTnCQ1iRSWi34zZKtuwU
	NFePEh04pZB9/QDnDM0Uv3ajQLcKXPxaNUmr7QbqRozaB9XJLhWROAaXD0FzOdvfzOe/9iKriE3sL
	8MeieRZTaGXU0JQAkrWYoLHBsWTCRrOgZtapV+pqtVvIICAMv/+nuh9cs8zDAIgTApLHJu/v/X+Fm
	RCQ0bpouTWbvC3oHO6dUmO+gQsJATOEPOt949FX++2LClpOgCYeOfI7OpzvK+SPlhu5EoYWUIhDVk
	BMuBTjfk+kbZukSqOnvoaOqy465HJYlUOMMBqnY6bGEYultOJsRxW8tUoFvnxyAx3DbswlA2Y58mi
	aKypS/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCEi-00000004s1g-2LnT;
	Mon, 12 Jan 2026 07:21:12 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCEf-00000004s0V-0Zsu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:21:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59b7073f61dso5996829e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202467; x=1768807267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBaom7v74+gHXWd7YrxJuL0o3qS56NROqcnQWMlUGCM=;
        b=I/9EU5Nzi5CpJsJ9KqNZwTAzuFnwDU3941NqdzQLREHc3pqxONft3AhxsyFnSC+8f4
         C8mzeUB+mEmcddAtRzAOPYFoY/0Iw6pxtyUU22WLHSvz5N4R9i2IBjge/By0FQAqIwzK
         Gu81zFffQhF/X4xbboOfPajHWTq7E+GDrWzxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202467; x=1768807267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HBaom7v74+gHXWd7YrxJuL0o3qS56NROqcnQWMlUGCM=;
        b=mCCWw9MPx4HQJMem+G5WIyAK0bnavzzHNIGW1J3VXCrIU2yyU3xaF+NYD1wbSN5Ddb
         oXpV7lP+MWYyVnvZeb01+1Zx5AJ4EqYvPm1YgQBQ8dCpptEd3p/KFwWMBYBSgh8oU9RX
         F6kIZVHsfD1XwQxs3wgCqZpDhJYoBVTp1ggF9D9Pa3VRlXULKojC19wjIkfFJ57/oSCJ
         xBTkWJHSp37AKJVK9uFKwsYcUPnzchuYzN3Vw+w7ew+pCCpApNI32gcbZU6AzlABCyK1
         HxL++hMoNf1j3LRwPdx6QGUwDJMi2vlVZhGwqMQB1ybq4qA+inutTzjf2xq0tZqHoxUG
         fwEw==
X-Forwarded-Encrypted: i=1; AJvYcCWG7B8QgOuoznXcrEmF9WCHVN5MoWPoKn0SzF69V3TYuNRk0A8dCdb6YWuD9rFxk6Il5m5YV4Kd45tJep1vlYvH@lists.infradead.org
X-Gm-Message-State: AOJu0YySX8DOIYBNZuUZntpKArelkB/l5Rcgav53Ahqw6wEEbiTip1J0
	7OBXx3QuHdpEeTaCUXKsyZ2G/f/qlczZLXTAgJePCPBQ4oX1oL8GrY7TSkx+oc7o0E4tgEZ387B
	Urngi5FhcO4VNi16TVQBtDl68wf5o7LV+ttxQb0Xg
X-Gm-Gg: AY/fxX5AAWdWR6Ty/u49qf9WHFTmN1kM95cgu2i1T5n+QZZEAUs7oFLNwSgRtZ1Q+WK
	S9BKmnRQ9G52tX5/ASZtZo0e1W1rIm8HddZ4rsp0J7vvlAb0Ng8Ur8i2/NqQ3W9Bbv7s4obicXV
	ndFBSPuh3uGI4IVSiD4jlj0CkbQywjC8rWlvtWBIwSW2TUBgxPsPNpg4l+Ll04mHVe/jvSaoktj
	3rK5nThh4Rpv4kI5/YoIo/sDxDQ9uu1mgDTOvqYcIA9Fn19w0NaQO0f3k8Qev1OL6rYXRlD+5Q7
	t+wqJVxG7SxOKCMDPbMKKbPy
X-Google-Smtp-Source: AGHT+IFHBYZnjE2UIMYyCZr1lmpvutyhqNd7MN48WeOyKPWqQYxDJZuAlIZdNeAX4+9N0k+bGMB+CsiFpY5ooLKHPQo=
X-Received: by 2002:a05:6512:3086:b0:594:2f1a:6ff0 with SMTP id
 2adb3069b0e04-59b6ef1892amr5277756e87.9.1768202467013; Sun, 11 Jan 2026
 23:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:20:56 +0800
X-Gm-Features: AZwV_Qh9NvJukEMC2ZGE9lVW3yo6iRXBbDejhBCVijUHZb39tsOJnyn9JZhLLrA
Message-ID: <CAGXv+5Ea9bWvuQJuYBgvwrn0nRT-utdLLLo5e=hOzFY21kJYxg@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: mediatek: mt8183-evb: Fix dtbs_check warnings
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232109_313879_69373B19 
X-CRM114-Status: UNSURE (   9.11  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change the Murata NCM03WF104 node name from "thermal-sensor" to
> "thermistor" (as that's what it is, after all), and change all
> of the pinmux main nodes to have a "-pins" suffix to satisfy
> devicetree bindings checks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

