Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D6CC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oNc1/5ivdS6YwhD6viDCHQpIs+RixUP6gKcxoJhdR4=; b=GPOyfNBGRHp57P5hpplCOaYC57
	td4cne68ySMyd8KEwlGdV0MDntmi+8KjHD7OJHisO0VPeulGW0gM4JNxAE+z9q58rqiBQD7g57Gn4
	zqTtX6okw5H0QfhLAdtzF/dY5oBxk5t/G76C+wxTJN3+mPbYBLLuhhVQqMiSMJuRu8LbYn4AIyrSx
	QpoXGKud1aMnhsXSZDFKIjA0wgj4gMPvdd6a+IXTRIV7sRVIYLIscu+IybdKSmrCJLAbhYTpqxO83
	cnauvP5RiJI1BtOlujr7/keP3CPytDOi9iDG5Af21cgf0dUPvj57pvK4A5o/+dT2CxV7Adk0XgskU
	fe7MbrLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweU8-00000009g62-0GPz;
	Wed, 19 Aug 2026 11:29:32 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweU5-00000009g5T-0HP7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:29:30 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 720921400198;
	Wed, 19 Aug 2026 07:29:27 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 19 Aug 2026 07:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787138967;
	 x=1787225367; bh=7oNc1/5ivdS6YwhD6viDCHQpIs+RixUP6gKcxoJhdR4=; b=
	OriZ3UGepl/zWWI3GRR+lVQ1nlZKbgGN5VddsSietWxk2dGLVPolluf2jjE+2St7
	HnQyzdDd1j41Ip6hZPJh6EdjFrzMo4vnopDIudEQTLLR5PX6U4z/j/SXc6pJTXp2
	BLuqdzt9pl89ppL3xR8EGke9N3UYFkIIHupkMz5pSvMToIjG+6/wlTyGe/3TBZB/
	s5Ku+hOIz2vAs0eKw4q2GCQfkGOpbfwyXXIqhm1KIYbZ5a9YH5JQekTjkUktTTzq
	73Z9pKWjvVBV/1EQpKoZgHFpBFn52vbkIC/1ie1++OJDiaJ+9ulFCClTzFqFNXK8
	JYCPHnFxNhDZoMLRK7bfSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787138967; x=
	1787225367; bh=7oNc1/5ivdS6YwhD6viDCHQpIs+RixUP6gKcxoJhdR4=; b=F
	uAxSrKgYN2/pKtu5MUzEy+i87kzGeRvsRctDXpjXobE1YIx/EoZB5UCKdedTZKzh
	ccMlMTt9Jzs6DXWriTWWwAUgdrayO5Mi0Q6IzSogU+PKIvwqEUVHdaTiMllZDD0b
	tW2t4GqjzIl7xjVOeybOnI6tqfNUPEy3tqceKSoixGtP4783RKvxEtVEnBGSHNcS
	+iS40LX87IsdIcLhaaHJeTvyEVMLulhwk/0vDCy9SsfwfaivJWsZEWsFe9pyXVvq
	PHjOJm7NakwmhYlElpNF4lXY+tvA0SA3g4x2XAWolUQsFEQ2bgLfoiFDGVc6WHxY
	c/DHsgk256ooIThOyDy7g==
X-ME-Sender: <xms:k5OFam2ruqcTzgkZfmf6jnb-zBH0C0fzF9IQ8pxSmwMrnQGSj_Go5A>
    <xme:k5OFav_RJ8pgPHmg_Kag8a1rFTIxPSMJkz85_mi3CNNvM72Ai2H1_qYqhfakpTDMY
    n0AmP37YGpysKh-opP9dFilAjaPP09sFq4l9eSd7w2xfi447JIsjw>
X-ME-Proxy-Cause: dmFkZTGvCTEqPi9EZFEQPxBODSEy1Xrcj34ymuRETnG7cldyIYUcggCqoJYJSqqmfyOLuj
    NjN1jgA5Mtm3lpb2ZxZO8CmLgT7/3MBp88P7e3Lm2LBiPewFxaobQtBU/HQ+LpJc6UvWN6
    N/RBRQUnvQeUx2l3/vQ+DS3Gb433zgqe44/O2nsdACRClxgJ00QOfrA1x/eH0dXcCopgW3
    Dafb/i4aBHWxbuRgEK5onm6lGwLTgCqeIfYpNu65mZ1kQD2FdUTdrIbAtyRG9rvfuqFB1k
    Um1L4UhaI0Y1Xh0GxoK/75mSwq6qhGP7kuLjRLyxUg/M83n63GzwN/ty5c+jq/P4Lo96LY
    h+rTqUlTUQbfKarLQV9/X6V7oWD/tVhkQVSTnFNMq82Gn6T+hI4LPWtLV9rC4mn8AjumSq
    HMV5IxpIpTMTaLVE/Qz6vVb50k/ec96KUhL68xY1qICQqn1jRqEtbBHs5PoFgWsaseZvyA
    pgHU4EbX27fLZk2SURY2VQYehZsnkx0Ni0f3ea/zWBXmdJ3bACWclvQRVJs6MgGpy26d1U
    ZcG9oHTWfuvaBTUVYN0PAqliDOVjYYmMnjKhdVfV4RzZFzMlZ5WHoq1FeW5JLTEvE/tcpy
    0C83Vo1wAnHjUjG3OQ9BS4A9ojNt0ZA366vxB49S/sb+bPbCeTBYBn0LybeA
X-ME-Proxy: <xmx:lJOFapKechxL6DTOLDQ0R6VqvunUxu-VgcIFdyXMtsaJvWzbzaNCkA>
    <xmx:lJOFahKulMIIOrOu0rDwVhMmLza5If4eP5HwOvAJ99vj8khxU9AZxA>
    <xmx:lJOFaj6aDQUcYvrcZgvAUsqpWr44riAXQXVSJFA_bmODxx2uE_4s-g>
    <xmx:lJOFardAOofMXSCcn4OiC56kXUdg-wsiS7bi8Ckceok5xvabbrkTyA>
    <xmx:l5OFalIxK1UiThNBCoXfrvUd8MLgQykNC0PGBJx692iQeBGSVibgcVtV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id ACFBB32A0074; Wed, 19 Aug 2026 07:29:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AcdQlVQC9j7F
Date: Wed, 19 Aug 2026 13:29:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <error27@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arm <arm@kernel.org>
Message-Id: <e385d061-f80d-47fc-8713-80fad1cec326@app.fastmail.com>
In-Reply-To: <aoWOakE5pmsnu9Ki@stanley.mountain>
References: <202608191405.jP6epa63-lkp@intel.com>
 <e45c75c5-70e3-496b-8885-ab0093234d3a@app.fastmail.com>
 <aoWOakE5pmsnu9Ki@stanley.mountain>
Subject: Re: [soc:board-remove 200/200] drivers/mmc/host/sdhci-pxav2.c:318
 sdhci_pxav2_probe() error: we previously assumed 'variant' could be null (see
 line 305)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_042929_178303_F86C97DF 
X-CRM114-Status: GOOD (  11.85  )
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

On Wed, Aug 19, 2026, at 13:07, Dan Carpenter wrote:
> On Wed, Aug 19, 2026 at 01:02:09PM +0200, Arnd Bergmann wrote:
>> On Wed, Aug 19, 2026, at 09:54, Dan Carpenter wrote:
>> 
>> If you have a list of possible regressions that smatch has already
>> found on this branch, I'd be happy to look through the raw data
>> for actual bugs and fix them before you spend a lot of time
>> processing the findings.
>
> These are emails from zero day bot and I just look it over and hit
> forward if the warning looks sane.  I'm re-writing Smatch like crazy
> so my own results are basically useless right now.

Ok, got it. I did receive all the zero day reports for my branch
and am already working through those.

     Arnd

