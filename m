Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCCA606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uLMvTPpf;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ocxJy72y;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BHRWNcXa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O6yBlpuOxfizbYunp9VGeD1o4T8S/iI/hNccth1cz7I=; b=uLMvTPpfskM8Jw
	lkT1gpUlYGnGPJ6vmiP4GzbJPGzzrlqMHnTCOccDhNdfaR1a1gh1v9FroxW83z43mOa8GDfH1J7ym
	cz4kRMgALxQe2hgbbpumgbCF/xP2Xy7Ww7wZMQuyYipO0jyZIirgn7yavcnf9+kOba7Lht+jhq3uw
	VEhOuRoTqBGpCGTHg+EJB9puHUDYkMc9LPWlmJzNdBD6kEKlOMTxulDZLiQWAaEbgo2eT+epmbSlX
	OlhSwbkshzrrUm9EuYfkngTS6wVFkz4Ae5IZxGby4Jouwx70atdl6aUINlrPm7jS0ub+3OPKitSNq
	E5BkHxflaVTyct/0paew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoXP-0000000DlWS-0fPz;
	Thu, 22 Oct 2026 08:52:39 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoXM-0000000DlVZ-1cSt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:52:37 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 55107140014E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 04:52:35 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 04:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792659154;
	 x=1792745554; bh=O6yBlpuOxfizbYunp9VGeD1o4T8S/iI/hNccth1cz7I=; b=
	ocxJy72yM0D7KzlpU06fUICc5hjH/OvY9oB7iipHTiX2sFk9VO0fnfrov1BZqXEc
	AHzlxvC1CKXBnJmG29O3ifdqpyT4ylKO6fMxSWzXim1Lot7s9u5QGrNzp5TX34ZY
	BW86VJq/qu51q89r5iIMZyOLtgvym3ml3EGHFmD63n4DFvh+yX1jCBWSdztVMJAc
	CqDH20UOgeOjlcZu7rEujjeFPS908CEQXI4LgPe7lUmgQH2emSZxsGm5wU4odcdM
	n3H40SJSgd+PlLMDvZaJApttip81Wuo4Ib81usjm+4MP2STscW3o+VmM1U8j0s05
	B/qmr0hNkZu7f+jDrYM5jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792659154; x=
	1792745554; bh=O6yBlpuOxfizbYunp9VGeD1o4T8S/iI/hNccth1cz7I=; b=B
	HRWNcXar2vKWXKSPCrlRTjLM/BCVPDqqA92f/TSmOxkXLCQ4499+pSOA6PoZkwpe
	4X62w1YSinWpLcJfLOcrMT2FTbeEkUVfrzAUhJR3z+gTnL+dFbodnc3/B33X4LRj
	9lWDTnigYWA2ven1rSlTwK3TLn5toMytcIa4vJDDYim12vKkwc6G+8EJAVS0AU2g
	CK4W06zQJ9DyEhAFS1+3WdiBn63kwFnA28TJZeU6h6WulKUF68s8RMO3G9Nkz3Vg
	eCnpzlXWEXZFRZQ6zZMsWwmK9CLY+UaJ/EqNOCEYNOz7SErEFmIufS19xkuJCfSu
	WCYv7oZlGDvkfXbLqUNwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792659154; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:BPwtLFY7JuY8Qb9Mb+/BUVVfk+Zm8z46nzX97SKvPASmSns
	XXY0QVmDBhx7WBWfJbHMWVOw20m0Rej5xDIz7jmHDxMUw/ZPQafkQGUbJPYe0bkj
	vRWS4+EEdQ7P7/TCxD4AIILIg5v14PAz7IOmX3uLl/GwQaXQdilwVrqXQZi/L3CV
	UQlMqhrwA5t0nRWtiapX0+QrfaeSGf4C6RkvmExFORVQGlq6T1VsZ3VTCh/6zBP8
	eXANdS9bJ/E3EW6Ohuds5+iSD8j9kMPsp7opywSajRHKHs2NfUfXp/DZwUP3NNkU
	mNZrMAY9G8sOoaxr3z/nwlDNwdqHg7gJ4/u3t2w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hTIA4wejWoa9ZudLpR+4WWeuGoQSxYTB+GiN07kEPNc=:v6VAXOL40dCjC9BVJxsmqBYYSb/lSlhxnZL7xs/8oGs=;
X-ME-Sender: <xms:z87ZakwmI-ewIkPkraiaLsoxsTBCAbp4NNSX5HJIMbmpfkUoHwqpNg>
    <xme:z87ZajFq_g-oAJBRLcQmNYQ9PQhNRm6qvpx7BgOFkvhi0ak1Kp21u2oQqpwKwEEwW
    vuibdOAkyGQjeOu4-U0NgCAxkMtCchm39HbeL6Kq6fb5mP9slr0lmxr>
X-ME-Proxy-Cause: dmFkZTGeolMu701xNJW/s/rtoYy6nZYfW+evt4Uy9xZgzghGkvk5U+yfdyAaDx4soJ2JVI
    wk+F+4s6HcEIRtn3gJ7CPe0lFVjXsH9eIPMj+iwjEA7QUr3GsHo8Fji3dXXsS3klk2b17k
    wXGiovdXyimdNZkJouNnz3KNl5G4nTdEU2BDyM6DIuM4oDMjO+DAPpOwWIBE8r3LiKvFeC
    0l+pT5kmOI30tzOlMrSJr5YABHVixrALB6NHBZWiFnwzHzJDGAQvdegZqqXOTZXIcUdMPm
    GPzpQRRQEjID0rzYFqh2tGbrUyBGeo9//O57+90xMDobW3Ga5pgLEK2mRbgc7xsPBp+Jim
    FJtdLxQIgwaNWyrheUM85YELFYhmSXRXzXwwUA5vTUyuSrHrUM9uaHGG7JdwcJSUc1DmLT
    eXSvOz4lo9sFliSvkDVuiB4Pxbnh5f4SJlEDj8ad06pQpXxD/TQjBLjj879SZfE9ahd8tr
    7ZqHSzSmU/rHVKM/zBgvNg/5lW7ovJn5VMxvwcglQyQpDUO9S4+AyCiKT77sq9P3RMbXhM
    d/OZ/waHdwWuau3ZgW2Fb0jII+6Dn+WZFx/qATblXcRzTnWk0mmZ0Op897G03f92qbLRe6
    rPuBFz7UYVEZvEW491ZL5kt26RbpTHvHUORk0Fr6GNrdy+Av7kAPQR0PP+Kg
X-ME-Proxy: <xmx:0c7ZaudWWKOERNcuJrUqdOlRM54UGVDJzkOrCd-MEDaeIa64FG3gDg>
    <xmx:0c7ZavFw0XS-kq0b93usKApbmZ2RKH-0mLtvyUrtuuIXT-Bbpagviw>
    <xmx:0c7Zan0v5KcHkUZhpYp6TMZxmcWAU0EeUi67dMrCVAQDxBnidnfj7w>
    <xmx:0c7ZanmwrzHLTlTnxWeyyq7Toh_N3eh4um28OkZv4yyxWZVVWkX9aw>
    <xmx:0s7ZasXiNLmHkuqXmYq-KGTLGlNgmTp9yHiVJy0ruPkXEra8g4l9LPj->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D296732A0098; Thu, 22 Oct 2026 04:52:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 10:52:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <ad9ad328-9f10-4a62-a698-139cb8b6b1a5@app.fastmail.com>
In-Reply-To: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: defconfig for 7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_015236_510957_B154AA5B 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.4

for you to fetch changes up to 6db3ea21a541d34e45f3727b71575424495df44c:

  Merge tag 'qcom-arm64-defconfig-for-7.4-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig (2026-10-13 17:22:48 +0200)

----------------------------------------------------------------
soc: defconfig for 7.4

Only a few new drivers get enabled this time.

The size of the defconfigs actually shrinks here, though that is only
the result of all the Qualcomm clock drivers now being configured as
modules by default when the corresponding platforms are enabled.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: Enable I3C and SPD5118 hwmon

Andreas Kemnade (1):
      ARM: omap2plus_defconfig: Support for compressed firmware

Arnd Bergmann (4):
      Merge tag 'omap-for-v7.4/defconfig-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/defconfig
      Merge tag 'tegra-for-7.4-arm64-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-7.4-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig

Bjorn Andersson (1):
      arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.3-rc1

Krzysztof Kozlowski (4):
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules
      Merge tag 'renesas-arm-defconfig-for-v7.4-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-7.4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig

Loic Poulain (1):
      arm64: defconfig: Enable EMC2305 and PCA963x drivers

Neil Armstrong (1):
      arm64: defconfig: enable the necessary drivers for the Ayaneo Pocket S2

Nishanth Menon (1):
      arm64: configs: defconfig: Convert TISCI to modules

Qiang Yu (1):
      arm64: defconfig: Enable QMP PCIe Multi-PHY driver

Sean Rhodes (1):
      arm64: defconfig: Update coreboot firmware symbols

Sen Wang (2):
      ARM: omap2plus_defconfig: Enable SND_ALOOP
      arm: multi_v7_defconfig: Enable SND_ALOOP

 arch/arm/configs/multi_v7_defconfig  |  10 +--
 arch/arm/configs/omap2plus_defconfig |   3 +
 arch/arm/configs/qcom_defconfig      |  14 ----
 arch/arm/configs/shmobile_defconfig  |   3 +-
 arch/arm64/configs/defconfig         | 151 +++++------------------------------
 5 files changed, 28 insertions(+), 153 deletions(-)

