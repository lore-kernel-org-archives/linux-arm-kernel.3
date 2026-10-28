Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E53606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+ZKlU+l;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ul7n4MfS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wW+/Xd8Krv/fKYtWcQLYyD+KltWSe3OXoRZLQJCTD0I=; b=I+ZKlU+l2lDC7l
	5FlL3LEeiT1Ary2Fvp4B5q64SodrL7dHUfvIAbs9oMw4WGOIpZZY6SvbC3RFI2vUy3G72aoZXi016
	l5y1V9Ai+TFlFNGvycAiFSkA7QijxjosdVXr3oSinH3uFtl1hScp/MKPo9iHrvLiTxjxtrgHjgAoy
	qM1pOqpPOAoddD7GAEBxcrieSFCUuh4EsjHpz+MHsJiNxkGDjH5z6N9qD+EN2VCkoPgAnOclo4yL+
	fr5Zx+pgwvK4C104EOVV1tAwNl7PY0AoI1CKDg4AibpDuqQ7xhoBWhKTtLHkSfR36y65wdVRRlwsw
	WIQoQRg8uu+fdvqP0Vug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM68M-00000007U9G-3WFS;
	Wed, 28 Oct 2026 16:04:14 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM68J-00000007U8N-3Sqs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:04:13 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so2150213e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793203448; x=1793808248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wW+/Xd8Krv/fKYtWcQLYyD+KltWSe3OXoRZLQJCTD0I=;
        b=ul7n4MfSkZiUAJ04RjJbxDk9hrO1k2HLO2UnhD5pcSnIPG/9D+jXYjufZPqXxMxz/+
         Tgj3M1KJ0q1no8L/b87V+o8cSEAyRtahwb49ffdtinjDJoUGkdDQKyBvc1DklVWbF14e
         9111JQFeI/pCUGrU2x8N0INO/QhLRUuB1BeM1XC/9TiLIcS5NomZ7URTYIu3RskMf5bS
         DNno00BxEcWC4RYJa/A05M+rzqDc2nSnNY97muecfhRAoacSBOdUzI8fgo2NSwubo547
         L72TUE4oEryFtJOLhH5cfGdqKxbgM4Ge51YTTKtrYwPPbosYgtBLuW0mlQKyWlY8+hWA
         h4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203448; x=1793808248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wW+/Xd8Krv/fKYtWcQLYyD+KltWSe3OXoRZLQJCTD0I=;
        b=cFSphqNCe/4ioGAnRcLrCJqJSEsJmJuQcqieDAt+jBq6TyUacWVB3LPJqFRhpE0yIj
         3TlsVA84JJVm3nlshtgtB/44pTUJFr6HUPU3m4Z4P8jkdaxqBvAhsrR1Tf7KpaQpS7qA
         uIT4ZC5ffVHDTvfI1Q6d6jsWa/Iqp9XvgpdQ9GRLrNf7hr4b/AFkst6yZI4UfyS936Oy
         g7Sdt3FNMwUR/Gkz3C7xhPkLj8/lXE7OPuXkkCLUjXyA0jt75UEc0vAZS8ZhFJ900wog
         JGZLEwGp2u75dKtvkQBnRdbPuN16Qpt1pt0HfIbtmIuH2ipApUSvk8CfLOugW4V69J8y
         3laQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKTCPiVyq0iawBEQAazDbRUqWGurY03KLgfaRUxnFtqeubrYhwkX/kMnlgp1aSNbXbCOyf6tbbBbB741QkdF6X@lists.infradead.org
X-Gm-Message-State: AFq9FYK5b/AwbIUUVbNOTCmls/jbOu7Zn5U0FEsmpFlOR0QdOO0j8UXy
	4UB22N6e0YlmX0ihgAcb0vzOJ2ILY+KTmEedR0xZm2NAJ4HtlXRxUw0u
X-Gm-Gg: AYBFou2EU05HIB8l36PPF58UTh15pdiqIcBAbWt8TF3bS8PedGmjlZfCb7SxEqTEk4w
	pxU4iidB65ciUnUQ3T4jnqT25qvUx3y6e2JEiUncAORhZfn3Tz2gjEdB3QsfYo+oaaOE1vXAH2E
	R6JwrEufbdW+B3fPi2BGhO+uYAhyGEIwAwEJyV2pajjq4CObCgW9/ZyFgPXthEA0+5tbaNFXwdz
	yLs09vlawb19Zdr//3er1DZAJVjFy1hykyhWr4MjJeuEuXrleY5Fvyp6x4YkytkMLolTV+OaPaI
	rcjMBR859+hgnhYVw5nxUGiqfVr+KmHzfSMxXYBBRnGRTD73t74o0UjOTevDlX+j4/MzfJZH4Pq
	NNPV7SPlGrGkTb7QFBmICqKWnifhD8wi2PJvLRCIUP9CgIu2oOQFX3fS5B+q3xBRkzRq1hl0B4l
	hqXDR4+idhZhyRjvHVyVzfcDxEhqUNuthX8DdKQzB5kjD0hTUdzrJ9Hj2mbTzNGD1o1l3IAFh1I
	yjXb3DkaSCMZkGv+5XkLNOnSBTtmC9uAVk3EkPuZWMHLVcR8nFsonFVLVUrYyBQtd5bV2nhyjgT
	+m7YVpk12XtT8W+GnHcKkjDBRq9CZMGEuwMSHd0xEL9Mr/3kS7vLZ3RziuDrBJ3AKtB6rwn5Zp3
	+3Q==
X-Received: by 2002:ac5:cd4f:0:b0:5cd:4fdc:4c30 with SMTP id 71dfb90a1353d-5ec3ea67966mr1617819e0c.8.1793203447486;
        Wed, 28 Oct 2026 09:04:07 -0700 (PDT)
Received: from localhost.localdomain ([190.177.146.128])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259db2d3sm6354565241.6.2026.10.28.09.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:04:06 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: cjd@cjdns.fr
Cc: netdev@vger.kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH v3 0/7] net: dsa: mt7530: support EcoNet EN751221
Date: Wed, 28 Oct 2026 13:03:53 -0300
Message-ID: <20261028160353.4239-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028011317.1557238-1-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090411_874035_336E2286 
X-CRM114-Status: GOOD (  10.76  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Caleb,

I tested v3 on a TP-Link Archer XR500v v1 (EN7526G: on-die switch plus the
MCM gigabit switch).

Setup: OpenWrt with kernel 6.18.44. I took the four mt7530 files from
econet_eth at 3a8bcd2e6398 (they contain every line added by 1/7, 3/7,
4/7, 5/7 and 7/7 of v3) and booted from RAM over TFTP, nothing written to
flash.

With the DT from en751221g.dtsi in openwrt#25330 (MCM "econet,en751221",
no "mediatek,mcm", dsa,member <0 1> on the on-die switch and <0 0> on the
MCM):

- 18/18 boots: all 10 TRGMII lanes found a window, no "calibration
  failed", "TRGMII inter-switch link initialized", DSA tree set up, ping
  over lan4.
- The chosen taps were stable across boots (+/-1): SoC->MCM 15-22,
  MCM->SoC 27-29. In the SoC->MCM direction the window always starts at
  tap 0.
- 6 of those boots ran iperf3 for 6 s each way through lan4: 0 RX CRC
  errors on on-die port 5 (~1.05M frames) and on MCM port 6 (~1.29M
  frames). In 4 of 10 boots MCM port 6 already had 1 CRC error before any
  traffic, probably from the calibration; it did not grow.

Following the binding in 6/7, the MCM does not come up on this board:

- "econet,en751221-gswitch": mt7530-mdio.c in 7/7 still matches
  "econet,en751221", so nothing probes the MCM and there are no LAN
  ports.
- "mediatek,mcm", which the binding requires for -gswitch: the probe
  fails with "Couldn't get our reset line", since nothing provides an
  "mcm" reset yet (the TODO in en751221g.dtsi).

So I think 7/7 should match the new compatible, and the binding should not
require "mediatek,mcm" while there is no "mcm" reset for the EN751221.

Not covered yet: cold boots, and the other LAN ports beyond link-up on
lan3/lan4. I'm happy to give a Tested-by once the compatible strings line
up, and to rerun anything you'd like; the full boot logs are available.

Thanks,
Cristian

