Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9409C606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E6TTBw6R;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=SOdb1tnc;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aI7PGZE7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D6CUUnUYe1v5QK6K1/TxsiRxM34p8NZub3VuF8RX04I=; b=E6TTBw6R9KrR8p
	sOiIetfGTkiWIoiPSzgL/YEx5Z2Bmlhoui2m2dnWasW7s+V/djsyBCgnsmIo4WmfUtpWK5ppFxG3s
	nufihBTb5VlKh2VtQIHaShEC5SkZAorucV0+2FM8mefxNtT7sX66zYDiKLvDCFKhbCxEI6FE0zfd+
	1xw52cf9PGVorHUiv1ReuhKFBjXKF0QYMfk7yn7HjKbiGkwM62GFTSJ23O7zPPvIQ755U4cCyg0Ka
	E5v5QeTTclvZf4z2YtvhihFWaUl0Y5BUGMWCdx/tNwp73KoTDeaOVXQMCvAILg3CLcXvLYWxBEQTb
	wJyVamohVXJIUZASACEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJonY-0000000Dnlg-22gC;
	Thu, 22 Oct 2026 09:09:20 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJonW-0000000DnlH-26AR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:09:19 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 33F72EC010C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:09:17 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 05:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792660151;
	 x=1792746551; bh=D6CUUnUYe1v5QK6K1/TxsiRxM34p8NZub3VuF8RX04I=; b=
	SOdb1tncOjPE9cq2Po/f/6yhWDSV/sl0b2oR6Yu1E2T7AdOuoUnDlKLB8UNGuOMn
	AIi9ZNz5OEg4fri8KYZRrQk5egAurwuTXUS1YesjiB4vsBv1704xQie5s6BwB3ju
	5XHk2ynk2L/1uUgL5KyRPiZnPNL6TSsDtA7GgTq0SpGqKyRxA9TqbTim7S3/BOeU
	vJ9KtMHT57gkFvHHoldSuHzBST49JPGFVd4eDdLr0AeFhinIcr044jLGZhPmKYrU
	UvnWkucc8DzINPGQNnFl7IBQ3J++6dobRaoeau7m9yypGHAK90qR6m+8Jeh7peTo
	M3lsXhpk2YETlTA0ObywgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792660151; x=
	1792746551; bh=D6CUUnUYe1v5QK6K1/TxsiRxM34p8NZub3VuF8RX04I=; b=a
	I7PGZE7aNj95SAOpBXh9qZyP8bQfRPo3Z2M1M8rWhqqz8UQn3E2zQRU9KJsSgmxu
	HGrV7SLDHppgXa6wyaUUSwp3wamzjsqinBezmI+ubrXAOUt96mZjni6rPVnK77K6
	IdnO2JDfZXkUHopOEZhIj9hBDJu1X7ZCNgqRM8OclzWH/heI8dO65SROlmI6GtpV
	tBqF6zYL4T7kg8JbUW9Ki1NVuEqMxb50iZGIrX9mG1qB0oxHz95QmauHi41YVPxy
	zVEAGolP2BDlkJHClnSbsRH1++d0ayGjJpIXyDPQazoxC2Zy7HC9fXMvY6NEeqvW
	/Sa206prfOQkru5JsKvTA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792660151; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:lPMahYCHOA73HhpmQDVipfgByMNsii7Dy9TX30SX0JVgvnf
	orXP+dNWyieU6AKzDMnd9J3Acvxb24+OgiU7/N5b85O1qHOEjfbWDua2KTcq1Hvz
	hLRsLino6OXPMxFPdvjDWl6AM/Ewyu+duvxRuHWqUMqo0O+NrfI3UOxjOcrr9Qaj
	Az1StLeopl8bJSfc8k1/B18dwRLqToA5cs8NLTAgVqJB4SJl9KI7nuZ2ExeWeGbF
	sSmdRDIif+KOXv7khHvFDcw/AtqP8+6QM1qdRLkhXjuJrDp3laeJxYHwDd3a79CE
	26niNMWuNdmAHpFhdWUxKPu8VHSd6yeJhvttfzw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:e881WKFYGo851uAR7beCzHbW9BdfIHwihFJgReFjIvA=:ErNyanEl2zklS0VRN5AsgdiS2hLnWb8QHeJ75B3UjNU=;
X-ME-Sender: <xms:tNLZapwicKLqDCqq79jsWxBgzjcBojIhZD3ly9ZjADGI0cT-lgFNtA>
    <xme:tNLZakG4NfRh2Ys-1ypA6XpcjyUWZ0pbqUSY94B3Y1m1DihVg7yitBgkHNAqDWtzh
    qbyV3BSCtTq3Voe2Nr74_syQ0e5tEkpzbjtXD-Mt_ZUTCyeUQrolr-r>
X-ME-Proxy-Cause: dmFkZTGa8ur5TNXC0VXssDoU3lnc8nXgknWTjil+IWFHzIF+Eqgow/67C4rnp2aA9z2oTP
    /T/2CeSklT6QnnO4qtFtR58CF00QCNeN8toDi6LVwlJGVDqRw9sVn3LDDobaqeQYtIjEPH
    Utq/XwZDZWWLY8YwIr8CAQ1pnwVFN5kB2Lu5+wisxPFHplHJSGTkyx2imbNzrXaOI324FN
    hCvyK0+bVjNFYGPR742uCd066o6EMmlG7kmfr3Zt1IexNYfKHXuqGLuc6qG/UvXtwtETzU
    FyxLms0rXUApkL7OnGVehOSTKkdOTJpuUX6dgVbGGxKRRjFOcGa5gDQXL9lCIipl15n2ot
    dwihxSKyVukRYwPsjZ0doWkZQ22jbJ/PKCkjGciaPO2aQpcKEjKk06altGhbIqUS9N0lXV
    lrEo9TMr1Cgqjr+V3H4BWsCs6K9DJ4Q5Sm3bt5R8qYA6m9Iv/rkLCSw0g9MMsIKEc3Phnr
    Yuu586mwxxa7xcEP/dq6+No/gBguuArgGdBLBojezOKr5Qfty2bD15+UzH+zu88yL4/xRw
    NQeKcgjrLckmlmwcc07qfL/ibGlvix/y1PwrPBPWo/6oBZdo2DnYo5jWHBCuUd4h4Erv1O
    iUO1rkWoRXDqaMFUBYeinUgzWX4qqmKQDOCb3TfM7VqbyY8b9Mi5IlrUOVQg
X-ME-Proxy: <xmx:tdLZauWIXDWmkuKHu_ugGz_b0TidnIHEJWACsmolslad0JS5JiZ89w>
    <xmx:tdLZasJELtelvPsgayKSBo9b2jvKLDDqF1FOdts55Ftt2kT1GVpcXw>
    <xmx:tdLZahop3BUbRd7JxcUlAW62jd6nqWdyDnfQYOU5uGdlvJi-seDnrQ>
    <xmx:tdLZarytobaufMoz2W_6kpNYKgzk_eAEL4LrqAOW0zqzvts5PAjVfQ>
    <xmx:t9LZaqeNyfRAfGvbW0i3OMIsw_zgFcAxY5zAQcGGaFgbXpdn8L6_YnbQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 33E0D32A0097; Thu, 22 Oct 2026 05:09:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ag7XcJBk_Kz-
Date: Thu, 22 Oct 2026 11:08:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sudeep Holla" <sudeep.holla@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: "Mark Rutland" <mark.rutland@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Cristian Marussi" <cristian.marussi@arm.com>,
 "James Morse" <james.morse@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Yeoreum Yun" <yeoreum.yun@arm.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Andre Przywara" <andre.przywara@arm.com>
Message-Id: <5da61969-8722-4aac-87c1-e9441c0f7092@app.fastmail.com>
In-Reply-To: <20261022090003.3083557-1-sudeep.holla@kernel.org>
References: <20261022090003.3083557-1-sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm: Consolidate arm firmware interface drivers under
 arm/
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_020918_612615_93DF879B 
X-CRM114-Status: GOOD (  14.10  )
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026, at 11:00, Sudeep Holla wrote:
>
> Sorry for posting this in the middle of merge window, but if people agree
> it is better to this merged at the end of merge window, hence posting it.

Hi Sudeep,

The changes all make sense to me, but I don't think we need a special
case for the end of the merge window here, since it is fairly local
and all those should already go through your tree anyway. If there
are any changes to the files in other trees, that is usually something
that git-merge handles well, only emailed patches would need manual
changes.

I would suggest putting any new Arm specific firmware interfaces under
drivers/firmware/arm/ directly, but delaying the actual move until 7.5.

To make the transition easier, maybe you can use this patch as an
immutable branch and send that to soc@lists.linux.dev directly after
7.4-rc1 is out, and then base any other firmware contents for 7.5
on that branch. 

      Arnd

