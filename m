Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D04606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lrgp1ysZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlNgVOf4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2bf+ycJ31FjWROHBLtqJsAsms5ifHfK4LcWycDMaIZM=; b=Lrgp1ysZlsUvWjv6bn7+28SErm
	WbsXixUTPf8q0pvAay0Lhz7Tq86SA48rBR7q4/M432/Is1MFIxyPkanXBfypAx8bnpbk3zNm8mNxT
	fABpSVvakrtRRFmqpBEeFQG69Ne4UMf53f5dLkXBIHyI52Ac7z1LtoJ18R0Vk4cYlXGoqXTFeIlG0
	jZQyd6QbG4I71mM3Y6mawh6QJjVAxSbqnlQ4N+lMYUF5++DcQR99WhNE6MIFZsGytDpkKnlBWgzU/
	sigN+wL/T86jLecsLY1ZsIkJXzUjnVLTgYcLgcdF1EhSzf6L02hysOlkXOZRdYxFz7PPTLL4RBnP8
	YOESephw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOK6g-00000003WCn-2xHk;
	Tue, 03 Nov 2026 19:23:42 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOK6d-00000003WAK-05bD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:23:40 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6f74f6b46abso2621453eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 11:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733818; x=1794338618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2bf+ycJ31FjWROHBLtqJsAsms5ifHfK4LcWycDMaIZM=;
        b=hlNgVOf4LwHxfMvj+F77+boQ2d7wxGb/nRc0ngxMjnJLq3D9gbCmmBYjHD0jV8MjFR
         wBPanNwWq0lJWMgbkp18WiquEXHbPpQ+q12OMaJYC4u7lf7D3nAWNXb8laj6wNBAx3YO
         oAl/FNvfhkiJ+uywmBaL8Qu9Vx/1B7q0qMhcoRmR7tMeuuVUqj+9vvRI7SzjXaP0s+ZO
         biKsVXaO0EqnCkEQQI3pTsuNTlMrdjW7y/gxGX9BvZYzaO0JKQ17orJjzdyoexFm5Cmr
         lo9PkSrM74o5boIc6DVi9w1CLmviL9/OyGzM/rGOKuXumzupwg1SYJYamsg132MIZKVJ
         4t5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733818; x=1794338618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bf+ycJ31FjWROHBLtqJsAsms5ifHfK4LcWycDMaIZM=;
        b=W7MnFNuVgM1hX05qkyQat07Q7RjDTo+k8A7f2M+pGV41NaahbTHFQyjacLco9vHlro
         WFTUoP+DZ66owM6QPBjAgEHMe6uiX8Y5zyH3wKZ1Nay1KFvSl0qgR4XxKcuOAD3Ssqic
         q2q1Fz9fvb2NU3hZjMlaTyIltYNo0kUMoziZ/esix/hn0Q8VQK8ztsNstx4zqD1SbFBw
         wa4rZ2J6QnYm8dJVLTyPY4j+JCeJVy9aahtlqNDcnb5OZmaipWbAg1Zn3NAZ7EhsdAh7
         UvKv6zgnStbAwWFPi2PMrmvCPfExSta2WS/pSCzGTpv8dD9b+xY5nffmpppQgKNfIs7h
         T7rg==
X-Gm-Message-State: APuU4Z8SDld7ZqdPnoLOxo8BjfRhGtPIBk2dJ/lficEyjWcJakgwAo/n
	/R/jHAGfhekD18KgH9gTNy1UWA//K7d0mZgc2qB94WT7ghj1PPvdv2DO
X-Gm-Gg: AYBFou0j5HWxzgisXWbbsCfiuSxclyguhlGc6bfCMTL+20PBUsFaDyC7RksP8fV3haL
	OxgGNbx1tFCpRb1wcwszclEoK5N1WauQjiO0s3Nl/Zs5KDYAK9sWqg7Ie57Lhg5nexWHsPsZpqu
	yl2F+oghEerYacFCeGm6WJ/i6RTu6fq3ltmTHFHWHiHV0jwoyMe9owd5KvL3/jYicu8h1VMAle7
	t/cAYV137zjwmjmBico13MQVKB3nDG7EVBZV5Gm9MfXXZp5A2AcOIPNElVF/0qX71DnDIPRKIqY
	En29023G5UnKgDyos9aC6X/8bXv3TD5XkftInyJEf2wE6GHDdmP8LHjkDAJXcHcuDKPMZAdixXV
	+3v8mk4+wiJQpM1X62KIcI1+waTaZm4JHzjS6frAQ0P3SwLfEB+y3k7U77C+jsV5T/DWycu66UH
	I0SbhfQPXyjLLhgWLw4uVgvJGBm7/v+70EhLBBERnHwFUkTPz3Ka2PBElY/Lt/1PUZCDot6eb49
	/owHlAeqBYzYgdeOzpSoB7oTPJRaeOlrb7Dhn5BBbL3L88UUPCCwTAsvxCWdGpkeahEDK62TY3N
	32k1bGPR9XZLc41/Wy+xJ3N7DEIBJ5Z10jSCY44mWvclD8xi8nFZ
X-Received: by 2002:a05:6820:4612:b0:702:f890:e113 with SMTP id 006d021491bc7-714f242df26mr6473969eaf.9.1793733817847;
        Tue, 03 Nov 2026 11:23:37 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e16ef1sm43323a34.14.2026.11.03.11.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:23:37 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	michael.riesch@collabora.com,
	diederik@cknow-tech.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Add rockchip-timer for RK356X
Date: Tue,  3 Nov 2026 13:23:29 -0600
Message-ID: <20261103192331.394489-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_112339_085841_76B02091 
X-CRM114-Status: GOOD (  11.15  )
X-Spam-Score: -1.9 (-)
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chris Morgan <macromorgan@hotmail.com>

Add the rockchip-timer to the RK356x SoC. The timer for the RK356x is
register compatible with the rk3288. Address range taken from BSP
device tree and confirmed with rk3568 technical reference manual.

Resending since I left a few key people off, sorry about that.

Chris Morgan (2):
  dt-bindings: timer: rockchip: Add rk3568 compatible
  arm64: dts: rockchip: Add timer node for rk356x

 .../devicetree/bindings/timer/rockchip,rk-timer.yaml      | 1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.53.0


