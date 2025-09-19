Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70C2CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+tk1VfFUOofOPLUQsU/UlXgqHr3TVygBRXFlzWo5xw=; b=yeTSO/CrE6Y2+PI08WCNDGrHct
	91C/UFrV8A7L1L9LwvXXACiqdm1me/RJ23bruwcV+eUr3+Ze8fbOSGL7cY2MFJXFOiA+0s1mTFVKq
	PSEHwzK+mXyOdwdTvaorkbisoJWLSRem1wqsUv+pisY7l6i0TWNRIbLJA8sCCfR32F8SqzoKs93YQ
	Wiv8WE0uWr7tWy4lR1eHoIo9MSZB2JAN1xCB1x+nox9RQXZY+uNVrLc89UZl06+J4atVD8JB7FaEZ
	/y/NgBw1/iI/t7+K00YIpSQkbIjOzkmM8V7J23HXYWcDYNEcvOkGlnCsneis+rXriqqvAn8O0YmoV
	9lOQGm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzazi-00000002xoJ-2qwg;
	Fri, 19 Sep 2025 13:17:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzazg-00000002xmk-0EeM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68B334470F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 13:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AD2C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 13:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758287863;
	bh=P+tk1VfFUOofOPLUQsU/UlXgqHr3TVygBRXFlzWo5xw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WuRwWgr5OhXq/DI7H37tILKtu1xg7sB/EO6Yjny2mVVgfLEyLMI62qgnuW7KBbaHC
	 InL2lCbxz7IZgFZQ4yiU7b1GvhowypVCUQ3zMJZkG/2ljsDkLrQSrcUhcz4gfLj0KZ
	 UuAw2BkI9pOnd3YuchbWvuebtBqsir2K4CWrioOHeDStwglbk2VveaBhrXGkbClk6p
	 HMg5lfyIj/5N/hGGJf84ntT9oBqb43X+NDXEunzf0zvzlaOpDA3RZzJ3rNXE4cB2tJ
	 i35sga197zXI/AOoe9NYZePNZEgUC86IS0CcTqWMdTXuXSr4Lxh+w0taGzKZU8ZJay
	 P7tI1DXlWYfsA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-336d84b58edso18445771fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 06:17:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YwZtNEKZ5oofAiD8AoQKtEBwt2I7ugX9JLbAPLopmIe2WazhTdc
	p5FN8AklbrXjfvcIXJPGSpfTyB5U5fZDv2whra0Zg32Fzfongw6Nggwq80D/ehpmEHwgqcWTgwO
	+B3Rh3NVSEm6UwzQ9RSCMqF2vBPFRLN8=
X-Google-Smtp-Source: AGHT+IFNLf++kbEIzx0OThSpG6tJqnAviAc6B/6DY8ZrvAETXBFW5NgJWfZTYT0yTkTslywqHEe3WA/DssvPTebSj54=
X-Received: by 2002:a05:651c:435a:10b0:338:735:8a79 with SMTP id
 38308e7fff4ca-36413c2c413mr8029421fa.1.1758287861610; Fri, 19 Sep 2025
 06:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250919122321.946462-1-abarnas@google.com>
In-Reply-To: <20250919122321.946462-1-abarnas@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 19 Sep 2025 15:17:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGe=HR7EvMs8D=7Uvr4Vhr7fXp56YQ9A10xdF1V1M71zw@mail.gmail.com>
X-Gm-Features: AS18NWDEaphGD0PnhTnMmMFn4cfpLzT-Is82GGDvSOsC9sPyIGDQ62hIiSlVl0M
Message-ID: <CAMj1kXGe=HR7EvMs8D=7Uvr4Vhr7fXp56YQ9A10xdF1V1M71zw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: modules: Reject loading of malformed modules
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_061744_110459_E8FF2A75 
X-CRM114-Status: GOOD (  14.50  )
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

Hello Adrian,

On Fri, 19 Sept 2025 at 14:23, Adrian Barna=C5=9B <abarnas@google.com> wrot=
e:
>
> Hi,
>
> Here are a couple of patches to reject the loading of malformed modules
> on arm64 when the SCS patching is only partially applied or we detect
> an alternative callback function used in the module text.
>
> The SCS issue is largely theoretical. The code currently performs
> a "dry-run" (which we remove), and leave module code as-is if failed.
> However the latter issue was reported to crash the kernel at [1].
>

Why are you fixing this largely theoretical issue along with the
callback alternatives patching? The referenced thread only talks about
the latter, right?

