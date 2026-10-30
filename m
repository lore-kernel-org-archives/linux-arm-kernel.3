Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD011606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PfsNyE33;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMDWMr5o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=; b=PfsNyE33W/kWel
	Sou+4ukc3O0v/6j4w2GYm/0qWHNu+nBirWL0MMeu4KzDbXtip2vmXxPoLHeHfaYcSE8w4dlaL74Mq
	7F+y+SXM8whRhGLoYhAozAo7yH0kRgAmgid+IfmUbdndRo8PPaQnQ4BwVlCbJeMLi2cjaaU/yBmxq
	rpjHXdj8w3tkAxDgEY9EIIcytwObO61+TRtCMcfYVPoejFV8ImR0cCgpPykPPflRetT9piWGoM/ir
	Ypzp/XoSy+v2k1NiD7hTSeGWgJvOEFBr2zh/GHJMYaEPzeivHgo8y+OHNIB/XS6IhrwY3H3v+p1Aj
	/gaib2hDitZqzZ71Nzlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlf8-0000000Bfj4-2nQ5;
	Fri, 30 Oct 2026 12:24:50 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlf5-0000000Bfi5-3fBH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 12:24:49 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-7ccae9f1a9eso341448137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363085; x=1793967885; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
        b=nMDWMr5oTqXOCckSzPGj01bNOx1izoerlmipldEBQxU0SEk7J0JdlYIOb4EKsKUzoh
         l8pgcnPUQGDClxp+ulCv+c6PyANU2D09y50O990mfDQ/gtwVInFOfnp6YSJwXDsPjBtM
         B3CwSPlOef/AmNiF2G4WfYU2Utr/lAb4xkYaRY+bXA9V/bEuE9ZoWVwwpW5t7F9Y8cdB
         XWjk+keq8W7FxRMrn0IGpx9bAXBEefdfHp2BpCstFCBZJDnerx4WSlTXHUICgH8Emxs2
         tS0jJZcDj9HBjnsi8c08uReDGhS8v5CeFJuFQPH3E6kgqUL3qDALbInYFjFjxKJsEaiE
         A+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363085; x=1793967885;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
        b=lVBR78SmOzlfSHIfl+4A+UVZGiRQyzUSgB99pixN+poMSe7XvnsseW1ZjqcPUwLORq
         Zzj4LLoXW2fvZm9iwWMUZMSuTo94qQ14V2lH2gbdJU6Hccx6+6wlgRFmV7KqEcDlGY2z
         wNNBs0U4MkQvFildl4tqv+wm6scC0Lt45JoFx2zk0UxXBigwhY7uInEh/l0cPCe7P5Zn
         t2hOcWx7Yi9PxU3V9rGUk9fFLQQmKOn0d67hBozj1TCE9f5AbYCarBnU3mf/f/YcTRJ/
         f7zRAVy1L/fzVPQKyKFxdfP8YUKxuiaLkLX3KkMlqchrtUjHcWYdlVQFkypeoQ3SZ7oa
         tR5Q==
X-Forwarded-Encrypted: i=1; AKwUvByJTC88kOnxWz66BdQVW6ZgQ+tTFYonZz5AEsX7lvY6f2EqHmmYAXHsSKaM4CMBdWtdHBWe2dBxZCyy4D4NBVGj@lists.infradead.org
X-Gm-Message-State: AFq9FYJ9i0pHwyDbEWgr8SYXjHqPx2HlVz1kksp0I5s7+68v5p2DlDkA
	fAg41pivBiU+JxwTORsTocGSgnCIvIivL5DHGpYnSIZMCyidKi3k7/2f
X-Gm-Gg: AYBFou3Y9gI+PoC/pkl4i1eFWTyPzz0qkYI7aSQ04N7utDLC6wBb3gR9XItfpSRs3mb
	qmKQh5HMizaRSNmJz5IZFsAqobriENrj1d8Y8kfwKq+uxroLlBTzYsw7byosRkhg6RZCcmV614A
	GMEke1K9xlkcWhJjYx2+1qxF71ZikNLRIW9IZRbN0MU/ITZTInpBfy1Ma0LOkc/8E70SWdPTnMH
	xq8UlOtquTJY0s67IOyP5ikpABy8xoMpqm82tGdjs/EVjS+75rSMJt5oSGf9zRJfZjBaDeqLdlD
	/brCHFPOrEvMSn+a/LqHxUpADfVhnVYx0/OWwXGZ5xesYe0KYhAN17FV8t7rRqukr3n+IN6QKLP
	ZtQVTa5xoh2LAE63Ya7qT3SwWnKlA/iJkafU7kRneDNmxa8eKxGrGDgh4KnIGQ76D4e3U+OH5TR
	kIWJcszPSRgEE10wAl8ptYLoZdS0HgtPM5CdvWh3RTikslMJ4HvSFNPgDeTsN2eCP09+DzzySa9
	APaZjlcOW4f5X047+g4eRDOyKiRczbn9MjQ+SFN6fXJNPMgxvXhFHs1VCWKVZ4Tr2UziPGQDvok
	xbdU85WBxlOBFJkPUFCRVVp9nnijN3rGdwbei5hqnwfEuaNCQHSWW2bn1ActWxjHwSyMi3e3ye0
	Mw5/fZWZX869q/gPNusoY6KOWrAo6u1A8I2wW
X-Received: by 2002:a67:e70e:0:b0:7c1:7ca9:94bf with SMTP id ada2fe7eead31-7d072c3fbc2mr1028237137.19.1793363085481;
        Fri, 30 Oct 2026 05:24:45 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf54casm2188412e0c.9.2026.10.30.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:24:45 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Fri, 30 Oct 2026 09:24:33 -0300
Message-ID: <20261030122433.1659882-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030-adaptable-vagabond-skylark-bacc90@quoll>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com> <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com> <20261030-adaptable-vagabond-skylark-bacc90@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_052447_912663_F6C13635 
X-CRM114-Status: GOOD (  10.20  )
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

Hi Krzysztof,

On Fri, Oct 30, 2026 at 01:03:31PM +0100, Krzysztof Kozlowski wrote:
> Just one paragrap and explain whether they are compatible or not.

Yes, the A733 PHY works with the D1 configuration in sun4i-usb, which
is why I used the D1 fallback. The A733-specific compatible lets the
driver clear SIDDQ earlier, which made intermittent USB1 enumeration
failures go away on my board. It doesn't need a different PHY
configuration.

I'll make this clearer in a single paragraph in v2.

Thanks,
Vinicius

