Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5355606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HTGfh4Dn;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHruNfnO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eAner/Tbdm+vBmCGePnRT0nbgyxjtQ03gRdPce+YEP4=; b=HTGfh4DnMyiygP
	0TPt0gT6AYNqfdQQgOX5lttq+1UWo+YMhnnvwD5qEI0Fluo3jaN83nCNZtSEP/PIPYWfz8ttKBd5F
	dlmktBrHAGoozA91FYuVIfNt+cT50Up9gvU+LBvxc7DiN69dShr9goA4Ou3RXtbDKAW50usX0z2Wi
	9oL8NojwISjZ5rCOu1WA6A6VGGkS0tswFxpZGXtkNbBm8IXMyGTgju2z+FEqvTi+btOkOlLr43ZsW
	I0+21inXDVaOerecOlhUV9FzdxYJo8bd4hVFn/Tl+R2bY/RYX95MGlmp0sSaJh4//E/1S+zmZycbU
	6+lELG0cjApFOMeuNhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1SH-00000009yiq-0mxx;
	Thu, 05 Nov 2026 17:40:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1SF-00000009yhU-1sl4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:40:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4910b863b84so687747f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900449; x=1794505249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAner/Tbdm+vBmCGePnRT0nbgyxjtQ03gRdPce+YEP4=;
        b=tHruNfnObJmInNXfCHq5QW84paPg9LRuIVVywkgdvpaQmvClpz9taDlefbBkoczFye
         2DOm6l447jeGXCPVut3JBAhYg13OjgvwElQ3u+G+72h8SZ90UPUPWqdXCUkjdjhAo33B
         oZYgUP7e9NAEba6bxUzZcIpkop4e1X1k3f1mBKzBaU8KWj6ADYhzvKvsfr0Uv4nuCzd3
         TxddskRjvSsJaD8MxC7VxLmsnTKRULQJ4TrktaboDT7HX55WNBP9EymiB8HnftXWSz40
         XKgkeiMeLlwWEogarl1CJTm4mtbGyzbc8xueZpbh+unJlQE6C+Pbgfd1guvf0FYHSQ4G
         9gNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900449; x=1794505249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eAner/Tbdm+vBmCGePnRT0nbgyxjtQ03gRdPce+YEP4=;
        b=Hr93+lqiXnO8Dby+2nhdXSPI0KoB/wL8evNEA3du86+b4RIbvrB6IqHnXNYnWbZ6OQ
         tzueICDqvTfKetTkGWP7EmT26ZS5VgyxNQEGllWcBh8dEtcC4pEtOVxpoNudCEuOg5mW
         ruH/1/Zv6HXBrFYysFqeETU9yHcd7O8tOG8A3YaWzKeJpu3VsYnZRZ4zBOhcNqm9s7co
         g9ivYhhGe1Zpdn4JFmqj4y31Ym1W8jX6kR8bTQqEm9s5im06G1SuEOWS2Jtii+nefxPm
         zerqXmzmm0v7RdwsG/PWITLsdIjvavbB5+IzLuJ5Pd/EfHrKaJyYm4xfvtdgVGFj4hD3
         VFwg==
X-Forwarded-Encrypted: i=1; AKwUvBx8yl1WK5i3VAc6MfPyLLAsfvRYra+XgFBQTX7me6o7pJnH0Amn4BBSdW8+86GOf6nilTgtINBg4sR2jlrXuExS@lists.infradead.org
X-Gm-Message-State: APuU4Z/0dOCmlKQX6HTuW+TVSsuc67SdO8btrux3RCN9cGyM1iF34KCS
	tyZzuGU8HBwGMu8b5DsCcuQjWfCzHYk79o5Mh+WgRJj6abZW0gES07pa
X-Gm-Gg: AYBFou2gQKGFMoSyRkyu86vyB045mlAAau/yRXzQvXvy4Kxn2zuko2gBhKVtrtLg9La
	LHMi34se42CMMbwDtYt+qCXwe4rJ6rPFVeXVBBnnIet5FWDQVfOUPSH/jQ2LBc/LYvbnW267v0z
	cysRhOUNiZlSuOurS5jpI1nLl4U4usUL2OGsbyd6EOIrmLAESojb+WLwiNAQERJMxZC0eQBZ1jc
	wfllr5DydejGIr5gszEQEXErPE9dG3LPSWpVjWAFbiuX8IBj02uNTq/DUPi9MUoP+NqtTNwhi64
	5e+2+dr/N6BrJnZ0QrW/GCKTouMWWC2bugYYqwLoX7wK4CD4+ZtR0IcVdgdlw9MuPfoBI6D7Ud5
	QiCiUTt/DBd5leZo5IzmtZMKbcYgfwNaJDcQ01+rAMUNFoRCBkjeNBtu0OZpU+6I3q0+NwnOVh3
	dXcQC6rSfdHEIB7USiUHiNYRUTiQNG/cNZddJ22mfmeUPjVd1aL3x1Co1woWOlVrIespdPhVWua
	pO6pIa0CC1xSP3AOGdKhs/nNmEqUnJpL5BLOee78ZoI+wDzuqi7vIjfeJs9poY5ATRP7u8u0jxA
	Ee76sFJQyPdcB6W7GxEST6IaNur/NChKagZxOdxGxKqgaIxZoRYYvKr3hhkLioKA7iduWaP4PPi
	23p7lpTUeq3tzUDJ4jYdHSdPCLBuhd67a+ghhlv3/qTHX4w==
X-Received: by 2002:a05:600c:5289:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4b55cf2fcc6mr61403365e9.6.1793900449296;
        Thu, 05 Nov 2026 09:40:49 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm81216185e9.1.2026.11.05.09.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:40:47 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: krzk@kernel.org
Cc: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: PCI: rockchip,rk3399-pcie: Add PERST# inactive delay properties
Date: Thu,  5 Nov 2026 17:40:42 +0000
Message-ID: <20261105174042.2307139-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105-exuberant-finch-of-domination-3fbd6c@quoll>
References: <20261104215848.2087944-1-ehbello@gmail.com> <20261104215848.2087944-2-ehbello@gmail.com> <20261105-exuberant-finch-of-domination-3fbd6c@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_094051_501572_56E58C20 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, Nov 05, 2026, Krzysztof Kozlowski wrote:
> Vendor driver does not matter, it is antipattern. Do not mention it here
> as reason to do such change.
>
> No need to repeat the diff.

Understood, both go in the next version.

> us or ms?

ms. The 0 case is badly worded: the driver never holds PERST# for less
than 100 us, whatever the value, and 0 just ends up at that floor. I will
describe the floor instead of giving 0 a meaning of its own.

> What is the nature of this timing? 100 ms is a lot. Are you sure you are
> not describing RC delay (we have bindings for that already)

The 100 ms is not something the board needs. It is the driver's current
wait, T_PVPERL from the CEM spec, applied on every board. Because PERST#
is already asserted when that wait starts, it is also the width of the
reset pulse.

On my board (ROCK Pi 4C) the slot supply is regulator-always-on, so power
has been stable for seconds before probe and there is nothing left to
settle. The problem goes the other way: the JMB585 behind it stops
answering configuration reads when it is held in reset that long. A wait
of 0 to 15 ms enumerated 17 times out of 17, 20 ms once out of 3, and
100 ms never in 5. So the board needs a shorter value, not a longer one.
I do not know why this endpoint behaves this way.

Which binding did you have in mind for the RC delay? If an existing one
fits, I would rather use it.

I also plan to drop rockchip,s2r-perst-inactive-ms, since it describes
an OS power state rather than the hardware.

Thanks,
Enrique

