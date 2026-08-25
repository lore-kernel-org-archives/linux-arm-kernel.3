Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34FEC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DKvm78Fy8eujSowinoqKwm9zvQW6YfH9Dhzf59l8oeE=; b=jLIN3LqfC7E/YfxPSxb4HN/ITc
	/TQ2lkjqkeTITUKeph2w+vSan1jZJE5SC/StSSpU3YQWUvK3zb7QKNHVd2kHffhI8ZXfI6IH3m6Z6
	Uw3YAXdyrVgb8WhhORn4zmV5SL6VDTHsu/Kg5ytGmGob3KqO20k6akK5yPGY4qOeynUZE3nNo3RJ7
	3hIDJ9hrrCLhUAl5fwFBjytxWCUfh7287vjMhqRBgYdgvKb0RPty2l/IHXC/9XvDY0jTusIZVcgxz
	NGyPV/O7lKlhOsZrI5rMDHUIJdRV37qUEm1DNFmoRqcKJO4ImuV1YlTRL5oaG4TxA/h3XwHrRU6mF
	hLFa2z/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywgN-00000001NMu-1J0O;
	Tue, 25 Aug 2026 19:19:39 +0000
Received: from out-223.mta1.migadu.com ([2001:41d0:203:375::df] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywgJ-00000001NLP-0lVR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 19:19:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DKvm78Fy8eujSowinoqKwm9zvQW6YfH9Dhzf59l8oeE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787685572; v=1; x=1788290372;
 b=jiWZC5ajuW022zQNYNn0Y3R6ai6oFyh+Pq4x4nKOtJKRXMqxEYVJpqAfGEhcMltmeHb7eQGl
 JBwU261NDeNsGzj4EwRRY6NddvlC2TMikSRsE3irQC2navR86jzZSzx3V3QX0RpbhiDX7KQYukC
 +UZxxu6kCeDWdvG7EqVvqStw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f42.google.com (209.85.167.42)
	by smtp.migadu.com with ESMTPS id 49107427a01c45f2;
	Tue, 25 Aug 2026 19:19:32 +0000
X-Mizu-Trace-ID: 49107427a01c45f2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so1536e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 12:19:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoPwdrcfL//VoA/LySqGE1y1kAF2/huyN2i215t161ckLooba35dO8e3IDexD4bPKSaI6d4YBdUInbTROLzuYtd@lists.infradead.org
X-Gm-Message-State: AFuF++mD1lDnMWNgvAuyL4qYoccBQi4B35clbY4VtPeB/5pw4ykvjYwA
	dBHdgl1dtC6TvQUYvvqU9FC+fPk6w+Ze5dcP4BNsjCWfe4a2ROJqvOrwUVuFb5/2/JJtm4og4fZ
	pofvc+Cm5LYBc8/KR7JYGIbq+L01HURnOt7pVJd35
X-Received: by 2002:a05:6512:3d1d:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b4a906aa7amr16193e87.7.1787685567670; Tue, 25 Aug 2026
 12:19:27 -0700 (PDT)
MIME-Version: 1.0
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 25 Aug 2026 20:18:51 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
X-Gm-Features: AcwNN1Vkg3j65I_3CoslKqusQZXCrltKZiVS5wGFWwGtWWIZVxQEv866MlWLf9M
Message-ID: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
Subject: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under arm64.nompam
To: Xi Ruoyao <xry111@xry111.site>, James Morse <james.morse@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Ben Horgan <ben.horgan@arm.com>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_121935_731466_33467E64 
X-CRM114-Status: UNSURE (   7.89  )
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

Hi Xi, James, Catalin, Will,

I'm going through the features that can be disabled on the host
command line, checking that EL2 either traps them or leaves its own
controls in a defined state. That quick and easy GMID_EL1 fix came out
of the same pass [1] :)

Since 10f885d63a0e ("arm64: Add override for MPAM"), arm64.nompam
skips the MPAM2_EL2 and MPAMHCR_EL2 writes in finalise_el2_state, so
on an MPAM PE with EL3 implemented the trap controls in both keep
their reset values, which are architecturally UNKNOWN.

I was wondering whether that was deliberate. AFAICT, restoring the
writes would trap to EL3 wherever MPAM3_EL3.TRAPLOWER is still set, so
it may not be safe on the machines the override was added for. I have
a patch restoring them, but I learned my lesson.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260825164219.3347229-1-fuad.tabba@linux.dev/

