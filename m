Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E14CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAtHv6jVtOKPfBxG+t4sPI1ngV8CsevwVhkX4+9+HYY=; b=Jh4t9LQ8mFoTBXBNCqeWr4COqB
	o8txrhNP72oXsn4w73QjycLuwT8zj8UT8mvLwibOfFGsdMBFmqmWvgHcHX3NrOOax1yVZS8AZyh1d
	Q9Z3oiCHKSlnt7IQDNJLT3C92hd9KManx3kw8EeXP1FYfxYdTLpmwOaihnVENd1tXE6mvYWeoUhKe
	32ao799ZJ4XMozD4BD/pd5W3VRo0n4sljSEnPluzBZphM04/NuycQ/0ZfUlc9wRPMwDgO/NviJu5+
	OrFQzuuUyuYk9+mG5sWKDrgzGRLY8shIsv9tImDH//Zs+WcLKx03fxcEwQJqVh7K/bpgQfEsB3xt1
	GorlMjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewO5-00000007b1E-47Zs;
	Thu, 24 Jul 2025 13:53:33 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetup-00000007JZI-0bEX;
	Thu, 24 Jul 2025 11:15:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso1768436a12.2;
        Thu, 24 Jul 2025 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355709; x=1753960509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAtHv6jVtOKPfBxG+t4sPI1ngV8CsevwVhkX4+9+HYY=;
        b=DgW+aDXAw+vqbNn5bXnJZhBqJKzCCGWxnb+huHkN3kxL+xc0XLm9LCnriRzW9wuvmp
         EAal5mU+cesWfBC1Qij4Za0FHJ1RzNwlWL6lI8jfYunlbiXVSZx1bysASY5Eroec9rck
         TMArex/eUI17JuaTy5TIOQXwFOp986RzcHOpjUepoYqrgWWqHOZGdEwN0jbQuuwDON1J
         kQsHiJXOefXg/xSzQJY/VmSGXxwXfhEE0Sm/Bh4RhqLYI44/oADZEUH8eHCU7yNwsyDV
         Y4PP/b+SHO2JzmURLbIuCcrMr/enNo0kowxmGs7sZ6tB1VRZpC/yh0oUTALiK8qirfxh
         8kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355709; x=1753960509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAtHv6jVtOKPfBxG+t4sPI1ngV8CsevwVhkX4+9+HYY=;
        b=Jv65JMeiBaz4Eh4kovLj8v97MbSMnSpZeOmlndfIgQV8xnPOagyyzTok6YJdlbDViH
         6jlUXH90ZqmqlS29AI9yaqji3DnplB+FEfdP5rmSuhvjzooHHzRwdt+IelHGOY6cLPwa
         ii3FGh/kMObS1/Gs9aOyBkBkcjK1Vp1RDcY+n5MVGmLvrXunODHYrh1v1lykr73WQxin
         xyO/aHJcLOMpLcpa7f8s/N4OXvDeBof2nZd4d9lZmw8LuEcpUIul3PWOSjVopdfBjfmx
         z3b8sUEvuHtnPUabawsgDspFSPqvT9K214i9m/eD86xGA/IisY3EmlsWrcpv17nXBlxy
         mFAw==
X-Forwarded-Encrypted: i=1; AJvYcCUbZL9w53xv7gMl+B+YvJMvDMja/R/efkXync2hIEpR4P7TMfAx4B13mihqms1uSc5mP4X/qHLd8qau+R7gODIa@lists.infradead.org, AJvYcCWCOrvLwjPmbbSivxsFhsZhDIg8SVZ1MHVAGw7p7suQD9ZrOFFcMjH6zIKtzyshm/1V5MIH9NM+eHBZx2UZP3s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLKNDmQkZDWPl/knz5pcpCeBR7z756hERRItpwErkKCIDttyQ7
	umlaCsmyExEf4Kzc7ENJGaNefmDd6mS3ke/vz3a0esM+9nlKOY+OBiww79SZduBBXCrEI1Tf9QH
	tfUV2dbrcbuoF1h4TFQ2XHo9d2FnVgH8=
X-Gm-Gg: ASbGncvIJ4HrqzeEPmH58w/Hmjex/a6d2k/QDXOkxNyVxn/OeGGlHPbjjsd7ZPAAlfH
	aO40l6Tw6ExdeckUY8cppK1Qd9QTn8ALo4GQzL1ibxxS8yvCVFiV3yGw6SXMPgJhXLIQoBPgXrd
	pGD9+eqfB0icWr6XxdJAqgKc91m6qXFEZ+33/mYpNKbeb+lX3+WGJrbQC5aHA3P7g+dwG/l+yv/
	lEQqYu3txSFFaJHZcS+
X-Google-Smtp-Source: AGHT+IGWvdFdi6zzckyJlm6N2JYQgwAj1cZ4UkHgtQjTXi3F8fk1lJZ/2HIRvhtKXI2VlvbdwgIvW4p0HjJsBk5xRxw=
X-Received: by 2002:a17:907:9487:b0:ae0:e065:ddfb with SMTP id
 a640c23a62f3a-af2f6c0ae2fmr725433866b.18.1753355709200; Thu, 24 Jul 2025
 04:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:14:32 +0200
X-Gm-Features: Ac12FXyOn0y78pX82gZjLVt_m4TA-GVnUEaS_-xxL1ntUx22Wj5veadNWvnjdU4
Message-ID: <CAHp75VcEX6FBzAu3+-5iia6Z1+kSQLYFGp0FnO71gXwCF+-wDg@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] pinctrl: constify pinmux_generic_get_function()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_041511_180773_3E161643 
X-CRM114-Status: UNSURE (   8.75  )
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

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> With all users of struct function_desc limited to only accessing it using
> the dedicated function and never modifying it, we can now constify the
> return value of pinmux_generic_get_function() treewide.

I like this change.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

