Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v5hekV/4;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=M3HzErsW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Rcpho1FS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JUlaM9WpYiweHE0HGw2Q5wyJ053Zlh4fRUNiE0Sei2Y=; b=v5hekV/4Md5aV8
	0ghNSDV+kkkbugc9F5IY70cmzWcTGhW2USEfe7Eh407cHPhHg7nI+ShDeSQjlkICterLhnXK4oXLF
	tL6FHzmJiRZUYAMMsiSR3eatmiIEaX7BRb8iM+TcD4Ia5mzyH2EyssYcmYzDIlekKHjkr0B6VwDVO
	bTK9TCUJLrcHpwK+rdIofnLAGVVwE+QYD6fWDiki41EgFXFV2NWEd54/tXG75MCwbsURdTfOCrhG0
	F97vvKyTwq4/m1WmYRsREPuNjZ0hdQkWoauo4ciWW6MwMcmyQyj13p9e67/TZ8MEQzfUqDLl2cs0s
	MACbKSgGmF/hQlJ1pIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMPD-00000008qDb-0fXy;
	Thu, 29 Oct 2026 09:26:43 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMP7-00000008qBx-44uk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:26:41 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 5E075EC02AE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 05:26:32 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 29 Oct 2026 05:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793265989;
	 x=1793352389; bh=JUlaM9WpYiweHE0HGw2Q5wyJ053Zlh4fRUNiE0Sei2Y=; b=
	M3HzErsW/g6HECQpY7jEbx00vA3JNOD0kWxX+foi0GfvdjHTK5bvycW/1PYGmTr3
	HXiMzam2M9yfj7HLx/HjYHLICKqF78o79VaD99UdwPJrgOV5n95dmpl5huX/C41R
	583nUwoWQn8IOC2VLMbDEyEJjcLMrd/bkySXlAHzAqK26+w0Hxt/Fs3Py67DjSaM
	hOm2yZbn4g8k5GgzyLEEx2wj30Lw+vLIBFh9cyGpZ08KsfU/BnW2u7qf4cwF8r9F
	1XKQjsKIuCjqfbGO5AUfeKQFePT7m2GnWadnLy0KCHGzNbviLKQrohuK2OyIJ1Cn
	dyAltzXnA4159R6LAVzhqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793265989; x=
	1793352389; bh=JUlaM9WpYiweHE0HGw2Q5wyJ053Zlh4fRUNiE0Sei2Y=; b=R
	cpho1FSSUHQJdVWcblRwyKVFWAc1mc/yyvdoPfIvGo5JnIEA1rHPwfS5ah7ZL1S+
	AXhGsg705BvLISDFkkDYKJEE1ABfvoADIryrlH2Q83rcOZkyK+23DzKguBvnrhMv
	eq8YFCFVQqz7AL48pvl60jpudi/X7Rbo67eW9N277ekXrKoMxWRsbpZKr6+dLUo/
	UGA0qnx6xhZ9Ac+kAIBoXJCxI/Z0nlrhIKlLWYsv0JuvY96pBYC6EZSrsgz0qnfi
	6Oel5RvolyjRAVnkGj8ToUxNvJtdPSo1R7fVS9blbJgHOtwultDUSUHGXh8e3IX4
	wyfzLLdUtxZOMHE0Gt7Ug==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793265989; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:cZ5EO98O8ByMapvoVDk6OUbklijICtwM0YC/QNL2sd+Ak/w
	9diqFt2nDaORBtGAmvAcQTcDhteW8eSGdeAU2HYDq89nkPyr2kI41jsTsoGpTcZE
	8Yh2sKvYqaQ3lUD3jF3pmfCfQNezcFtiD44km/ptdGMEhrFukV8/X4EfY7fEDoK5
	JHPQUiiKOdbSa3U+1cMWBDIIKxlOUHR9Dn56Lp1V9sM2AYbXoi7Hp0uVhb2RalLp
	Z/4h85fBKchHQ0oYhda5GLAma6VqHy8fnX0iLVlJwBCRHNrO48BnVp37nzWt6hEK
	ssNbm/F7CsciSCpIIyMhbb9lXEOA3ucjMZm0uOA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:gRYhEuLfYPjj84Rlc/L9H4sSFVrF9TV51oEklc5wsJQ=:bt3SsfUt4OeNoUM7vK/Z73nVZvQ599oSq5hQ3F+V9AI=;
X-ME-Sender: <xms:QRHjaglpHll0wa0l8ETUmtD9fM5hSvvBOWT2MCvZq0yT0h5ZGae5HQ>
    <xme:QRHjaqqiK8J__Kj3fKPDmRKHEiYduaHxPC4bjINj82iGPD8vb2HbloTQp_gdiorCj
    ibsLnh2eVw9IlFpRd5y-vsAxC9yWa6CTcEaHeUsZefCmfJZvO-jMh9k>
X-ME-Proxy-Cause: dmFkZTEydLGx17G3tJGFs8/rLhDDNPytwT57npfrZUsvU4FFkOlqCeshcDsfNw4WRb6bmp
    nc8bKdNhN2BRlvzUFgKOPR/2G7dfvA7UlOBEAJFiSuSCqWHgqEsEceT7rOvJIy8oZVyOpx
    p6kS3PcLzBdM3t378p35pFs6p3tjubY1QAzXP/Et/3h1zVQfzgII1sArGBOvcD/6XR8GzZ
    2WAQsgjJsipmY8ohsl4WNPenetVPsHxKauAu1Qs6hdpE5PJo9vxvBHSxuGj3tlC6EBbFlz
    S+kuJDxq2+gHyzSK6BwlQ3DmT4N9KJitrVREfXyjBMvc+8tNkmmIZlOWNGWuuYAR4yoFZ9
    aXfKa0KUApkRfHpIwg2v3AyJ0UMKsjzM2OmNSdWwJt6NrVWk8JiYZB5jLlM36GleMhcWVp
    P+nQy2CmN1sCiVEfqsNtOo+eMYXEaLyNuDIaLcvCppwG/9qkOkPqWN1CB4kVIeXT+yrIGq
    rl2pogtbB64T5sFQtscodPHZObWWTnuXyIKsWQ8sMifty4ZjUo507faJg+OqLPm0i21tdS
    P56oU4Y89ftFskAL8z0X8Wu0PuWnfGM6W8aYzwlbVpWiWC4mNh8YR1+5jlXHq2gP3f2mBr
    G9dDvOCTfHMl0adVS8sGckH/ecJma8ygW6YzCLG6+1ZzZUGRkosTg75eQ4Og
X-ME-Proxy: <xmx:QxHjagw_8zbmMxvqDdbuWxyG4Qx3L7KYSqHPCbe_SA3wmIoh2_35Xg>
    <xmx:QxHjaqQXSVD4itmDLfpAKla35wOOvskshe8BrjBVRa-uDy7GefjC3A>
    <xmx:QxHjatLRTHH0rmJlT9CX0moceHf8GOVMTmBNWuUrjOGbNcFSb_MW6g>
    <xmx:QxHjahUTQo5x1QXjcASV2nrIy5VLwHtEYrZk74UWhWPvYuzeY9-sEQ>
    <xmx:RRHjahM0wXMhwIWa9bdUu7ADKEwwP0GgydMwqRgjldSArJNW2S6Cnch9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D347932A0093; Thu, 29 Oct 2026 05:26:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ax_s3xrhtzps
Date: Thu, 29 Oct 2026 10:26:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>,
 soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
In-Reply-To: <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
 <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com>
 <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net>
Subject: Re: [PATCH 1/4] gpio: sa1100: register software node for GPIO controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_022638_716904_C75091DB 
X-CRM114-Status: GOOD (  18.22  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026, at 05:23, Guenter Roeck wrote:
> On Mon, Jul 06, 2026 at 08:14:00PM -0700, Dmitry Torokhov wrote:
>> Define and register a static software node (sa1100_gpiochip_node) for the
>> SA-1100 GPIO controller during sa1100_init_gpio(). Assign its firmware node
>> directly to the GPIO chip prior to calling gpiochip_add_data().
>> 
>> This allows StrongARM SA-1100 board setup files to reference the SoC GPIO
>> controller in property entries when converting legacy platform data to
>> software nodes, resolving pin bindings directly via the attached firmware
>> node without relying on name matching.
>> 
>> Assisted-by: Antigravity:gemini-3.5-flash
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> With this patch in the tree, the qemu "collie" emulation no longer works.
> There is no console output.
>
> Bisect log is attached for reference.
>
> I am not suggesting a revert if that is even possible, but maybe it is time
> to retire collie support if no one else reported this problem.

Thanks for the report. My current plan is to retire all of sa1100 by
merging my board file removal series for v7.5-rc1, so it should be gone
from linux-next soon but still be available for the LTS release (whether
that is 7.3 or 7.4).

Hopefully Dmitry can spot an obvious fix for the regression, otherwise
a revert is probably best so we can leave collie working in the LTS
kernel and not spend much work on that.

      Arnd

