Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pJDzbEiH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HtlrjyfY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=; b=pJDzbEiHLI1yujH8VHjGa4QbEc
	ddWRrSrV4Xg9hZxyqbhuHdcv/0W4BnF5mkcCwWa4Fi0GZd0ToIVNoK7wV8BDBxbuwu0cqau776GxB
	g1xj+V/bq+eP3ClrtK8vlojVWk2O5nKaQ7TS+C9LY0m+O6Xx9mjWfKLlrkdXoMv87nHn3HqhBjs8W
	wIWEZQWkLsxeaEkYOrSmzG1Zfgr+xiP5GToo9/+wABkukeJdAABjLgKRTteT5SfcNhzEQ4Spvq7VL
	/or7xY9t2RVr0+O3yHlrMPPPeYPC5f4dRCF3dfGxg2MhV45CAjRYSAhn2M/Rd6Y3DN/pmr1/XAKIj
	KZLMwsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKyji-000000015og-3Nph;
	Sun, 25 Oct 2026 13:58:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKyjf-000000015o4-2MRD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 13:58:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1333238f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936685; x=1793541485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=HtlrjyfYvt3aUcZ4cKC0MX+/cO9bWA9i0qZA6drSOwzd4PNOQAqVfN0HNVL480DMYL
         lXE8tyayHuWnG3GFZG8qKq449GuMDUELdzQu48IhW9v89ab/7K/Yf89VtsA/8DsIiccX
         2IZm4ZTBcxgkj5J5wBRGiKOVAdIkJTXMEn8vnGekKWNAJusuDIN3Bztnq/WY3GK+Onps
         MNIrVMQjq5TyhtrwiqqG4x2vrdgKo/Sg+jfxs12fxzPZVBlSFn3Xum+qfeB+WghkcLXc
         SckiySsRkIdaw/aFyKU3Lwvn+5pYfC2I6rxG0H50XJ9/IYJux5B0x72YiGG9S2e6vF77
         s1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936685; x=1793541485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=PEq/fze37LjMVtxzdET2L78sAogNcvG/eBJH4DEkR52XvgUzYrw5nosj2LlUKL6kMp
         FVO47QuCm5PVPcWQnsDgspURLniv6djY66stpOGlqe+5bXZOF9WihyCgN8ajuMNfdeen
         5LLicJOY4W/k+E8NCg1Tkmq+wWHMex/Gy4Dniwm7QlOrxCds9tpz0SwgDOLuX5Y3G77z
         XMPd0wUKmFEEESZoDGIPsdDnHW3VcTC00F9Loiiz0KO8LaQX+rMVNetFQlOK8wtsjybW
         IPnSYo7qNRFOgaLryx9pGya4q5tKggOdm60gymoKOHH/P+ED2JcNFWLs/0kYrFHpYkW0
         cQpw==
X-Forwarded-Encrypted: i=1; AKwUvBzW0Ps6EfuruyFjr5TNGi74TzZYavkOxVOpAW2jtz01+R5nRLBla7/xlkKOo9Y0f9NkGKrckcb8j1wghY7u4Waa@lists.infradead.org
X-Gm-Message-State: AFq9FYIuJ5uqSagUJrHb7KfommtZSP6l1ZXGTu9QmIHj0BXcu13urjHc
	LionqPuR6lmK5tBcwsQYTuAYRlKy64BnNbI/hpAU0B2nv/YGcWGpjVVQ
X-Gm-Gg: AYBFou22U/E+DEofVYMyQii/DNggSbDUG+Gc9rDfUGLxKUY84EfSJ4Eolx3awXmHh9C
	8BAvYHQCmQAlKv0kDje3cJQj1z8pO56H5gOXcfrYyZQvWDOxe9p3GKDeeByWh8FeIkh7Yh1NcF4
	Ca2eGHmeIUqkjh9/dHu+U5ygh4P/BSSeZPxKQprgt9y9OmFZ6D1QCAiRQF6Gb7gDz8VaKNFq47C
	WrBgwPF9UDLngjrajqoLReF8Z47aWgmUn9Iuf7cuGaPwo+z3hpgGjzOF7NmGutq944G7fDpavBU
	h5YHBTZxPrdFRZnGDsIPm3PDe+s4Mcu/R/Jg/5GEtvgQFJ1s4FYZL59A6Zf7acpPAhsWS51P75M
	3YdfU73I85squArVU5LVJOdc/j66mSBmVoQ4G6XGT4n5fw0o0vqo5mscmCcT/gKgYzQCo99Qn53
	UtK0XYjxrq8XZVefO78RVyehVgzCX9MCRaHFyG8ptJVqhqEjurFW6PFhmcx3U2zsqxQiHZC4OuF
	VFqUqLZQGVPdrUAzWh5JY+XCv5Wv4wtex3M4BCRw+De1aMSZxHz8EarXvCmn3ejxVAuhHpX6N5+
	Sd0gAqypI/McJQ==
X-Received: by 2002:a5d:6308:0:b0:48e:20ed:ce67 with SMTP id ffacd0b85a97d-48e3eb8bf9cmr5477047f8f.23.1792936684892;
        Sun, 25 Oct 2026 06:58:04 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:03 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 13:57:42 +0000
Message-ID: <20261025135745.102970-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_065807_642271_9EE8C32E 
X-CRM114-Status: GOOD (  10.64  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 5 files changed, 13 insertions(+), 13 deletions(-)


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0


