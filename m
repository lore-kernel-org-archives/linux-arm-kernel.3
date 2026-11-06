Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B559D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 00:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cp0Qnvld
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SGxBcvwVnn68G0KUIWhXj4n7e3+LPqUj3vgSEpFFHd4=; b=Cp0QnvldNkKSVCuEparlKFHhAQ
	5nN5IszTiZqG8nE43hCXjTdFn4L+JHLlMFwOOnZw7l4xQiyJv+7vodvugFjGGZbBBJ2KObzRHgtvd
	/s26Jz25fnVtC+TLs4rIlSGO9/tcA2u/vc0Sn4EP4ZEDawB1mr2jbFIPWUTTCzn8XwBrts5SvIq3e
	cUB9imTl6B8Vdj4uOu43x9DdYYNfprSsHD5l/b5R/4Z1f3b71x4iAhpdrFpS79gD4Ws+HvEZFwX4o
	/beMG4L76xak7yOEuDJiVyIAy7VJo4Mm/J8Qdoq0s/YvldYYcs/s4xwbnEeSjU1rRbzfC6Jcmw9TV
	gp8gDlbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7fC-0000000AuP6-0o6O;
	Fri, 06 Nov 2026 00:18:38 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP7fA-0000000AuOk-0rEV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 00:18:37 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f8a519e215so114521eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 16:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924315; x=1794529115;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SGxBcvwVnn68G0KUIWhXj4n7e3+LPqUj3vgSEpFFHd4=;
        b=hxOQvm5kDzjCe9ZG7DE7XL3To5tyVOUCXCIBT4SHKJ7j2vI23r6F5TNEX72Z0dOpJb
         3eIsknCUYYlAyMZMmTPLlxg89ZNYkjo9Kf5HkoELR1jZ+fGTmVKKNDlGNAFY2ni4y7F6
         gGels2bddaJUw642bO/w+SG62KjfmL9+CGJMko4HZs3/twrpecdKWbeCGN5C9YMp2V1h
         TtdWE+IOJqk5ns49b2oJDi8mVcd/sllQ+jJ8JHG1cAzPi1Nl3aefZbg42shibeSdHAlJ
         vOabAnYNV+w82CZbestLsZrklROksPMWyBsW42SGrDeKeG00Gq7E+LQH39044DUVCPKU
         X8Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzVKrYUZGDfN+Z9kAZGAvqBBo6inZvN4VYiMwUbpH2ey7FkurXFBBlDxljYbwocwvC9Wrg+F12YFV3AAJ288e/a@lists.infradead.org
X-Gm-Message-State: APuU4Z9XYT6lC2F+6FNorIMznWP/Su8QIQYoBHqpdWHDYqOKhiRoapoC
	bM+oKPdqBnNWiChxvyrm5A29DSGrC5IUAcwf7GsKDDQpydoLe5pnaN7lDEhhsB5E
X-Gm-Gg: AYBFou30rCciCRGQpyQ5vjdWl8foxADHjECAIs93GM3onGmnDpdhYVLTCBFcDf8ZSDp
	podXXtoNVxuyEUKE8oT4ZhNfUyd6GlHxYycG/urKtKvQ9A9C+DwCbRY5xp+7Z97aVIsvDyOM6UA
	wzDI8vhCuCjDeO4TM6rzBqiaBr9xygitTNntMWuToEwEv7VDvsPpl/EKS2NCpQvGKc8rUChDuLA
	6zZUyKhiXJ1ITlinfGoS6h/xVvbrkN2lVqQM+J5nBGFnj2ihJ/pkMX3fldOxN06nw6BKQgBWcTE
	aNzQjDlpaqYXb2pVkJ+LWE2jH0peCRAOCXcpZpP7rE985K/oe7MFZYTuoNS+V3TQ6nDPOir7d51
	ND5EwcHuojNI2y6U54XFKnK8BcNjDbuHTqkcC+59VGUdCIHa4CGMkbgN3Bhru144Of+ucor/WfO
	DE1j5Q3Jl5Ick5xvGYtO0ioaGZmI1Re3D2IdNE8bNH2RD86jaSvEh/F1qR9vKPt45C5NuEiI9dB
	XdlDxbWyCY436Z7m/vlA4jJpmHGL2XKaBybYIbAQNG1afbGzkOEsJy4CLvyceOGr9mV0hdCP/gg
	TSbnFbjMBbGPAGfdbY7kinWNDOlGwwH9D7RSumlO1RukbZTC8mjs67AeXuqDx+bqI4gHnPcPrwR
	Pf9Dlt9902yRjoU2joQwgK8Vabgmw1LGfcQBUBxjC
X-Received: by 2002:a05:6820:308b:b0:70d:9d05:de7 with SMTP id 006d021491bc7-716e79651cemr629641eaf.33.1793924314930;
        Thu, 05 Nov 2026 16:18:34 -0800 (PST)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716ea18a791sm570078eaf.14.2026.11.05.16.18.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:18:34 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46556b9e02cso81071fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 16:18:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwqV8gAOSBEQ7XESY/2b3c4VmX8lqLwcqddDAdjNP8KKlxjLwmOOxzQwW6sIq6moaKXE2fsmaPA/DcLY9+NNZJ6@lists.infradead.org
X-Received: by 2002:a05:7301:90d:b0:36d:6a77:960a with SMTP id
 5a478bee46e88-36f73893ca9mr1104956eec.1.1793923970093; Thu, 05 Nov 2026
 16:12:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
 <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch> <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
 <7b4ab738-85c9-4747-bf89-1a5532af6901@lunn.ch>
In-Reply-To: <7b4ab738-85c9-4747-bf89-1a5532af6901@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 19:12:37 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Pa1T4v6=3K+qN-sJeRivJqGbUeR2svJNcrLHtA=Th+g@mail.gmail.com>
X-Gm-Features: AclHuK9z-s31k9cdXUmtbrS436ZgZs9Mvql6VWlVAJgIq_YcqPSSmicfRgm0TQE
Message-ID: <CAPY4CJ6Pa1T4v6=3K+qN-sJeRivJqGbUeR2svJNcrLHtA=Th+g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_161836_269694_9255AF4D 
X-CRM114-Status: GOOD (  17.63  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> So i think we need a get out from backwards compatibility. We need to
> be able to break running boards with old DT blobs, in the future when
> we fix whatever is broken. Maybe the best way to do that it make the
> MAC glue driver and the DSA driver depend on BROKEN.

Before that, I measured from the switch's side. The switch driver sets
its RGMII delays on the CPU port in nominal 500 ps steps, so with the
MAC's delays at 0:

- Switch to MAC, with the MAC's RX delay line bypassed: the link works
  with the switch adding 0 to 1.5 ns, and fails from 2 ns.
- The same with the RX delay line on at step 0: at 1.5 ns from the
  switch, 4 more steps of the line still work, so step 0 adds at most
  about 0.25 ns over the bypass.
- MAC to switch, with the MAC's TX delay at 0: the link works with the
  switch adding 0 to 2 ns, and fails from 2.5 ns. The TX delay line has
  no bypass, so I can't check its step 0 the same way.

Measured against the MAC's delay lines, the switch's nominal 2 ns comes
out at about 2.4 ns in one direction and its 1.5 ns at about 1.3 ns in
the other, so its steps are only roughly 500 ps.

So on RX, 0 does mean about 0, and the receive direction still fails at
the standard 2 ns. That extra skew is outside the MAC's delay line: in
the switch's output, the board, or the MAC's input, which I can't tell
apart.

The DSA driver, mxl-gsw1xx, is already in mainline for the whole GSW1xx
family, so BROKEN there would also cover boards with other MACs. Would
BROKEN on the new glue alone do?

