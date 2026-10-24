Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEAA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PaO0j7H8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j8B3DhPG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/uDSBSON0zRSqoCF+kBzR4qoVmokC3Xn3ipHg55DqZs=; b=PaO0j7H81VJKXT
	yIBf2gz22b/of24bpDdWNAs98ftpirM8Jm3zNQqYjxRG7t2NXq8x3dwYy5kH+M2I2jXMyr5UhK+DS
	DrxDuZjN/9mAfoSdtOQbz7DPRaAZ5IkiHp2fh62LhjuJfpoJSpNyILQk+6SSN/CJeFG9a/uHd27C6
	ChsEh/5zIM/1PRdYlTaF6P+KdADX2Z5Jx7fgZ6390UjUowj/tLK4VOsvAVmezdgdZ4ouIgsbb6qzC
	MyMmVK3SQLk1pS10tm1nNlwWSYfgfqGCcTMnAqeZNoFqzrd+WH9FFadV3HdK4biaEGOvnBmsSHLwW
	RuGZ2CfWfn874vTJas4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKjCv-00000000Y05-2ruw;
	Sat, 24 Oct 2026 21:23:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKjCt-00000000Xzf-1lrJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 21:23:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a218ffa23dso8707985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792876993; x=1793481793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uDSBSON0zRSqoCF+kBzR4qoVmokC3Xn3ipHg55DqZs=;
        b=j8B3DhPGCkGME7kyWxD4hFqpAVxutburDGUqo3CTDcxRqha2oLFhsRJrh9m9JHUVUK
         im+JsrHBbvXe7k/2j6HEiuVV6Im+ymhhJeRifjl/aSzrsNaihARXM7uytJYBROO9vPYN
         vVsMjeE2yZpS9uUiuUnhHVdcO3QjktTjzYAd9eH/B/QZErhrUQe9Biys2NPsgg2rh9J/
         QHW9VMjSD7hPswBCTJPpQssFSp6CpDAtKcht3+FxRKW7lK/SE38UMRSh2gZQVIbG9Bum
         U343sNYxaub7Sx41L3kTsIckoS4/bXpJDyfx1W0Dp61JvRVKhfcfr3AlKMcmRcXsd0K3
         Jkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792876993; x=1793481793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uDSBSON0zRSqoCF+kBzR4qoVmokC3Xn3ipHg55DqZs=;
        b=vcAu/jdV24/rQPmTVJWEwQ9ScXXRWB5LvL6AJfLm3jZ79fPuukkIPi2x2evE2DCCpb
         XqxN2ME/xe2YyExBfr+ERbZ+y+6voaEDqstDVOslBwInkHxBCm286vrv/1/uEop8+bB9
         qpNwiiUtJDCVdQx2LPAyuKGqQZvpgwnwWGZR/mIWNAyfF9FcOvyRX6MTHrySUrlsS3TP
         Zt3I8R7LRKCvrFfioj3sq1+XVOvH58wyuq5CWS7fupAADToGQCI34QoWBwrHqG4Uy0+U
         GVFpCTzR3J4O9LJIz2N9K5GnfqzZQiZk5Qb/kpUhgDhb35qJuZfqtolIgA7HtfmYiGjG
         cPdA==
X-Forwarded-Encrypted: i=1; AKwUvByh95OJLUs80IGYoAHXqlOYHYBylgvfkKu9KKlFT1tNVJILMSYcqQ/wM/7x5B2DRvvr3xZ4zo5BpTnK1MIMrjfT@lists.infradead.org
X-Gm-Message-State: AFq9FYJrMehWAgcN7YkwIap3j19NpCtZxQf2aF01y1tohXhySxXc85Ra
	JSgS/ZaWpPipX6+y3sQduMkpMtmdyf2DawI1iYqpmgiSiOhDJomdVjI9
X-Gm-Gg: AYBFou2u1Gu+5QkaC0INguSS9lyHv4u7vUmsjX8OqosM1PIAHC1L8OmdBRuASOmIWYZ
	4kddZYZfXS6+8PdKOCSA2QvwPDdwvpYU+6XkE1w0HD2qtsXWt4yc6tYso12X6tP93wVzmz41ZKd
	4ufgyfLQ0RLflweIsPGIB0J0rXmJ4bFXPcFMH8yLoZHI0Me4TU1JepEp8nZzo3c217dRyjnAXWG
	wVzFKu+TfZuFNnc90CJFyp45PohwJ67Om/rVMLOZD9YSuBsDY+vvQewJ3JX8ED1vBapacOHY2gM
	dK5S46/fCzTxOmDCJxy9+bQJguAjLeTJL9NS3PLcDOjFL0hChVHt6Ux3zIqfC+oVeE6TvKepsgf
	9TA3OgS6Y/1SARUtWvkeX1fTtIkM9w+gk/DGvQk6bcUCCTqRs/59E/UDh7gKQxTVxqn17MT8DgD
	uabRY2mlntqJq344tfdeyc7g5jE00JLdrKlwoll4gGDMmBK3VZUGQynAm2YI15glH3Vey8Yscoj
	2dAUFxs1SX75yJRLhDrIioJXrRQ/GOwVRRieHY3PQ/NlcgASfO9h00tC/X/fe64lRs/jIb5KUo7
	/CJ2Dw==
X-Received: by 2002:a05:600c:6095:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4a35ac8bf3amr39663215e9.11.1792876992941;
        Sat, 24 Oct 2026 14:23:12 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm147825395e9.0.2026.10.24.14.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 14:23:11 -0700 (PDT)
From: Amir Noohi <amirmnoohi@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Igor Velkov <iav@iav.lv>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] genirq, KVM: arm64: Avoid the irq descriptor lock on vCPU load
Date: Sat, 24 Oct 2026 21:23:04 +0000
Message-ID: <20261024212304.2620845-1-amirmnoohi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87tsmb8gdv.wl-maz@kernel.org>
References: <20261024022450.629980-1-amirmnoohi@gmail.com> <87tsmb8gdv.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_142315_517422_46CBFC53 
X-CRM114-Status: GOOD (  11.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Sat, 24 Oct 2026 12:52:44 +0100, Marc Zyngier <maz@kernel.org> wrote:
> Looking at the test case, this really isn't a representative or
> realistic workload.  This is a contrived setup that has trapping to
> userspace as its only purpose.
>
> I'm not saying that this is useless observation. But it is not
> something that represents something exacerbated by "real" VMs.

Fair enough. I checked with real Linux guests running hackbench on the
same Altra (kvmtool, in-kernel GICv3). With one vCPU per CPU, and in
lighter hackbench runs, it makes no measurable difference, but it does
once busy vCPUs share CPUs.

With four 31-vCPU VMs on 31 CPUs (124 vCPUs), all running
"hackbench -g 31 -f 20 -l 2000", each VM takes 76.5s on mainline and
60.4s with the series, so 21% less time (8 runs per kernel, no
overlap). In a profiled run irq_set_irqchip_state() was called ~2.4M
times/s and 47% of those calls hit contention. With the series the
contention on that path drops to ~7 per second.

So the case that matters is overcommitted hosts with busy vCPUs. I'll
make that the main justification in v2 instead of the exit-to-userspace
test.

Thanks,
Amir

