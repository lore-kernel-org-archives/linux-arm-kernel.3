Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ACFC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15l+Ck2zVP5gQKV2uGWTazJsT4fiAOxVQx+2NTaLaec=; b=hVSAkImDnEH5yM3LhBPTvPCGph
	i491uA1mboQigbj4hWKZU5IcIjFnkM78H9wPmTizThpMhnNmWRJ94/4hwGMcAHKye/HG1hzqtAYDt
	wBoWT4DhCMmyyyP/AgFZsGKl+9GC/b2RwdEdlHsV2hOIAGyNfKBGbXDMfI/vhXN3TUBK2Y2/o7sm6
	agAbjvDejwsR9HiPpbi18ng5EinGlKAgen3NpOVSNnrkn/WdQHXB6x3+mFafcc3z3zwWFGoVtyEcA
	HU5AWh22Z70UUxBhcrR90AhQUx1ukBxRIUMECe72IravGFQ8jqCyYevua3BHsSaBM3Mxt0+mu6yB1
	sjfEQmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RYE-00000006xvD-2cNa;
	Mon, 28 Apr 2025 16:41:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RUI-00000006xKq-0Bu1;
	Mon, 28 Apr 2025 16:37:47 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-739525d4e12so4194185b3a.3;
        Mon, 28 Apr 2025 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745858265; x=1746463065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15l+Ck2zVP5gQKV2uGWTazJsT4fiAOxVQx+2NTaLaec=;
        b=FpyQHDYBJiVw4KOjCJvp4q7waL58U6YA5FHhmhWE2oOHxsk4tA3bf34YQ9Aiwohnko
         lfqI27A6iQPYgLZn2a5S3AG3hkFTf5w+oDadpfHIvmBQDgqND7ZidaaLz8gDxlvbGlBG
         SaWCsUyXoQHfu4+1NthMUJuReSYo1Kae3NEgIJG8o75uAKkPuUFg2m+cTDX5Wb1YZsLt
         cczp/XDbHHFLR2yez0pyu7pKF5G5iIAuLA86tnncHzhR88pQxWVxWEFbonoG/7bUJrRl
         44OUQHswd0sP8fEasjM7i4rWSEecTXAn7Ctt01FLo7GwHd0TQxedcH9rZjKnIMUHD4AS
         8Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858265; x=1746463065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15l+Ck2zVP5gQKV2uGWTazJsT4fiAOxVQx+2NTaLaec=;
        b=WB1dUpnirgRH+SZENhufn95gCmGJWax9fWOhIxFM78FBv4RCSHNrdaSrnwkiYx6TdO
         y5cSKTE4TIC2C8wJrSQUslXKt8hsxHNGbXzHzWTLFHJ0a7Kdbcx9Naoyqqo+a5Jslxfm
         oojWNZizdqcpnsZvjL63H/GeWT7he42Zl0zNMAGg5O1Q4A2oNIPhARa2jsEZE/bJi48U
         p4qFd46qrkYTPUhtmEaiHAcgse6jUaJoXOHpWanlwCw2D2bST2PssujrC9DmCelK31pd
         Q8wT4fa7LouGmY5xvMyYRoagYYXcwZu4RHqj2VlQJLAtNCWo4/3U7emhbHjnbLV5uoUD
         9Obw==
X-Forwarded-Encrypted: i=1; AJvYcCUXO5fntGkOVJp/IkWqrUlmeAg/aVvAqXJWv6CTLarFP+RnWRTNIMwVmv7hr5F8JAI4LCvYQYFG519CtKgPwXdA@lists.infradead.org, AJvYcCXvfh41yoA2EY0+bZmRn5dacdcCwbIBom/XQZpFCfZkJQH6KE/LhinT+XEQJj6GIrZBICGLCxn7ySNqOHiyOdXkqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOL1DXqEeoMPtgQArOuFPDupijv/RoOT6CXj4kP9JZLzRJk4jL
	ni+oN4+intIyqRC3SXCfaKYjUSNuKH4MmCijITj+95zMbCIxgTCe
X-Gm-Gg: ASbGnctBAaOL0HZMLVqdHlq7K+l9danuh5bjiP9baQdbDr8fR1Qzr8tCmO9HlgHKORl
	o36Xh+El/owaqS6DwJjuZ9takPzIyowQ4OKjO3RLvfcO/DSoO2oFsGrmCfACFVNInYUyuN7SCck
	M/MreTUNV7mmnKj14Xend6DvbacxKdefSVWKhc0k1BnwHuevvv9Uk3/xk05rMa6csPd9N7EhCQq
	XrfQzX3KtJfCYauVq0mPkT18t5pkkDxRXDbXkdafc15FMWn8AV466Iuy9FvnsxMRgFvDPR6GhLj
	hu2KnDJIg6+6l9mu0cDeePAMD55wWspsEabAOwiZtafdRbfL9CWj+wD+HMWSoG6v
X-Google-Smtp-Source: AGHT+IGlOIxAliEh5JOjeMShPlEUUb+H4S5Pr3AtTiv9tWNQlP2KLvR8VlBIrHywr0e7xdeNjjCwnw==
X-Received: by 2002:a05:6a00:2e88:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-73fd6beb19emr14959366b3a.1.1745858264818;
        Mon, 28 Apr 2025 09:37:44 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25ac87d5sm8213532b3a.157.2025.04.28.09.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:37:44 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Mon, 28 Apr 2025 23:37:18 +0700
Message-Id: <20250428163718.15918-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
References: <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_093746_100693_902BAAB5 
X-CRM114-Status: GOOD (  18.93  )
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

On Sun, 27 Apr 2025 Andy Shevchenko wrote:

> On Sun, Apr 27, 2025 at 11:25 AM Nam Tran <trannamatk@gmail.com> wrote:
> >
> > This patch series adds support for the TI/National Semiconductor LP5812
> > 4x3 matrix RGB LED driver. The driver supports features such as autonomous
> > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> >
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> > Changes in v8:
> > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> >   and update the title and $id to match new path.
> > - No functional changes to the binding itself (keep Reviewed-by).
> > - Update commit messages and patch titles to reflect the move.
> > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> 
> Out of sudden without discussing with auxdisplay maintainers/reviewers?
> Thanks, no.
> Please, put into the cover letter the meaningful summary of what's
> going on and why this becomes an auxdisplay issue. Brief review of the
> bindings sounds more likely like LEDS or PWM subsystems.

Apologies for moving the driver to auxdisplay without prior discussion with you
and the other auxdisplay maintainers.

The decision to move it was based on advice from Lee Jones (LED subsystem co-maintainer).
He reviewed the v7 series while it was still under drivers/leds/, and explicitly recommended
that I move it to drivers/auxdisplay/.
Reference: https://lore.kernel.org/linux-leds/20250425101112.GB1567507@google.com/

Here’s a brief summary of why LP5812 fits better in auxdisplay than in LEDS or PWM subsystems:
- 4 outputs drive 12 LEDs (4 RGB) using time-cross-multiplexing (TCM).
- An autonomous animation engine creates complex visual effects without CPU intervention.
- Supports analog current control, PWM dimming up to 24kHz, de-ghosting, and phase shifting,
  all targeting dynamic visual outputs rather than static LED states.

I will prepare a v9 with an updated cover letter summarizing this background.
I am also happy to make further adjustments based on your and other auxdisplay maintainers’ guidance.

Thanks for reviewing and helping me through the submission process.

Best regards,
Nam Tran

