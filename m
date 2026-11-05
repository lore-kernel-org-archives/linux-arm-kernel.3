Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E581606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 02:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WpnxUAgs;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cWHyTmCf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=; b=WpnxUAgs+R+5Jv
	LI8qVkrgIkuVDHfqaMJqbPKOH4bH4M/xU0yry5h0F9UF63fAb6Mor+YNik56DJ6lBXPSxouH7raMt
	reIOJDgkQitcNMzjgQR4zawS0p4aIPU/IZrSxpV1QIJlLafEs8tbWi8WNKEbMtx1KqmJ1hm86VHbD
	Y22pAGEOXQkklq0OHWlRy8aDA2ptCP3qn5dcKHUk79ge3QcLeicJG5uk52q4Wk5FqobUTvmx7nk8b
	tgHdRYD2qFKinncT2eB8tG0lxPmpF/vCjpK+CcyhVX7H7Qi7GZfJHjrg0/t+xK/CEXclYWFUevAN+
	pPrB5JAQM0L85Wklo3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmyp-00000007YMV-3P4t;
	Thu, 05 Nov 2026 02:13:31 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmym-00000007YLZ-3Sv5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 02:13:30 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso5976a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 18:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793844806; cv=none;
        d=google.com; s=arc-20260327;
        b=CRaKQ2XaRdSSTfa4uVG9NRLn6JlzvfsgQwzfphoM+E470HFRbkG523MJ8vwAf/jahJ
         AeilKycfVPVyCwTDmpM6MO8fAH/g58OfuQ7wJC2URzxma80cDRlpo9VL3OZ709i1X70g
         kUfeWHOuLBSuaqhF0T/dVDAA7t0XJ4N6WH6g9ATQ/h+1HP9CrehEiSsJoTprbNiCHkQ1
         qbXOIEVCIVeaFuIoX01ODXkSySluf2vZl67lgBY2ALycHdYB7J9v+1tZIzV9l0/+6Z96
         fMOvD0EMCYrfeXap/qE8onbf2DEeL5D8au4Ktf+klaW5bhW9GFrp4QiI8UGw+GMxiBG3
         rbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
        fh=byYMqiDWl850aTziTpouqCZVLVMJ89+xVxRUQeAHNIE=;
        b=rerMf/J8FOKdQB7WZYAA40E5n1gB8h9A5EKyCXPFaoSijIs18heg2UiqOTLdm+fTqd
         7+U5gEN7wiqy+dtJrkpwK17ZLv7SwWh7Cx2G0otm+Wfbo/PYHOuD9P4tvrc/TQIWKT1Q
         VYKtqOsohcFAa/7ilPYo211QMAG6u98g2FhjJ5RFhpJixbIVIqzWU04axlDit8HnsQil
         leDndfsEqXXcfqTuwXSq0WK9feUMg2ETjVNEmyZaxWOXrF7+a55BWSWMsVLHA1YwTKgs
         NHe3QftSwPG6XZ5KLGPhI8EYHO/Bu/N4+112b1J1WmmmiMTeR0KI3OBWg5kq5xwBu6Yp
         +V8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793844806; x=1794449606; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
        b=cWHyTmCf1VeFdyLG0HWHxCeOAHFVHuD+SUrReyVMa5EXpJ4jCqNexHMwh4uYjCK9nf
         QqKF+AYsba6zZUA5E/sZ0QHRoqDB2Dr4QmfOGBWyLg5ea5wTT2530wWei1e4TieCSXL8
         IJYeQODqKpfviUI6BhhcOP73p+uUxVYv1nIWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844806; x=1794449606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpziF86+RxjzNw0Zs0xyBduF0/c5YvcNE86OKRmU6Dc=;
        b=aBobts3vde51ZvKW9saNTt5va8yqSe5uKfCPveqNwvMuDnzfy5cDlCiyGxE94RGnPz
         1QICV2JZqI8nimkFSS1aGjZ4hc42yryGPY6jJ5F04UAQcqW5oo3GgTeqdGvZFaOi7UVT
         LbTtflHiTG1NJOko/WTnnSUrFXgoKek4M1C3zRSunq4DfOKzJtndChFmJAoMBqV5njQN
         md5Vgy3M3d2pkSn/qpMYsejys37Jwe3C2XtkbALVWfnlD+efkSA3u+6yVVSqPoIqQ03S
         w+aldUbu5dfWj31kWquyrytgZHwXxYgDpTTNYr2hLAdls+Zl5fSGayhaI/RXQn5qpeaZ
         bvOA==
X-Forwarded-Encrypted: i=1; AKwUvBxEBxlhXt+7gvcFYoDCheM6TByKy4iaCa+Q5jqqWoMlhpa+zwOUI/6VPUL7gCD+yAO78+ppUClp5GH+2S8lxFiI@lists.infradead.org
X-Gm-Message-State: APuU4Z+a65t4OFwd+vppnkwNkuNWZUFxlxgrVadfBMr4QEv7UeSsxKyA
	DKfEZNQCFihCmQRMjv/aP7sa5uSehyMO3NdI2XmT4FuPdpDXN54PbPL9alxrJo0DlbBiMxn1lRS
	7F/10uQRMlShqwHc46uwSvCisDoe1/BJ+DM24fzry
X-Gm-Gg: AYBFou0PIwU39UJCNU7omrrhtuzethFjlm031PIz/2LDN/vbALvcvIDuKy1wAKy9N3z
	sCK1Q220E4RHR8tgmbuzRD3qjsP4ZCAVaw7lRkXQ293hKHksjqd8OztSkwIilJL9BoWxc6AkQxt
	KaieFP13Og2P2KpI2B0RyGMrAKKIcwdcDRzMr6D5JxZuIVSCC22+6B0SPb9AwLsCyEAlBbZ1O/h
	MRdc+2j9HgQhCB5W244sP9lDciM3z9W3SoifBvMOgd7uyJ25k8/uusPo5b0Xl0LXJfJgX01w//t
	ARX0MqtJyPrVh62PHfEGA2tTi9qHm7DWTiwHuVHtaAnIZkj/34NlmiKq9jh8qcwONvqk36Xzsj8
	iY2ab4wHXR0jpj3lO+BgYcgrypcegiR9aP4V9/n9dZ+15RgqQcb02V+1CU5/7ktufNq8CLwjdXn
	FooehWX8jjWwrBX2GRDY55IQ==
X-Received: by 2002:a05:6402:7cf:b0:6b5:65ef:440e with SMTP id
 4fb4d7f45d1cf-6b57cdd26d9mr21493a12.12.1793844805321; Wed, 04 Nov 2026
 18:13:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 4 Nov 2026 18:13:12 -0800
X-Gm-Features: AclHuK-125zaIgRXhhjwYItELasBysm9j_wuLFip_xcu42o_jtzCl0wz_NYTSuw
Message-ID: <CAODwPW992ncQNo1yxrOrAKKZ62TB_U1eYWstZuTKDKqFCFGRSA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] watchdog: arm_smc_wdt: allow a list of SMC
 function ids
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-watchdog@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Marek Vasut <marex@nabladev.com>, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_181328_917615_2FC5049D 
X-CRM114-Status: GOOD (  16.16  )
X-Spam-Score: -9.3 (---------)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> DT folks, is there a way to keep the list in arm,smc-id that you would
> be fine with?

Perhaps this is a bit of a hack, but you're in an unintended situation
that wasn't supposed to happen to begin with so I feel it might be
appropriate if it avoids adding a whole new mechanism to the driver:
What happens if you simply define two watchdog nodes in your DTS, one
for each SMC ID? Both of them would independently try to probe, one of
them would die from getting an SMC_UNK, and the other would continue
working to pet your watchdog?

This driver started as encoding the SMC ID in the DTS and that kinda
seems to be the standard for drivers interacting with non-standard
SMCs, so I would prefer to stick to that rather than hardcoding IDs in
the C source (if we do that for each board it may end up being a long
list eventually =E2=80=94 I think one of the reasons the device tree was
originally adopted was to avoid things like that). I would be fine
with the array solution but I don't know about the validation checker
and whether people care about reusing the same prop name with
different types. (FWIW, in the device tree a 32-bit integer is
basically a 1-element array anyway, so we might just say it's always
an array and for SCMI only one element is allowed.)

