Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2619360A381A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NyX/A4Rw;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=KymEa+OS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e7Xd2E8Pqzn8FccF1WIpaz3JmDCeqSOjK2ia1Sxg5as=; b=NyX/A4RwNGyeQY
	xTLlbxRW9yTeiwD5v1uZeE4mLbIZFXHzD3JjmIzl6T+JnWh7dON+3KnDJje548MAO1AC7w3zkuZKH
	m2pr+SJdgx1BVkX/PxDa8AoxWQGC7UYh5Jb4c63goddK41VggfyT7BfirK7phSfjRPGy1fwXo9c2E
	rhfiGihopjAKopHuz607wegoCyNLYPgapOsBCBIKNcMw6V/5s54/gLWSTzrrf44ebvw4oWqo9bxx3
	xV+S05HU99xsYDNQVI4A5peyVschNoQCQI/zXdlZAAjcR4U6REis2AhaMMFObxDrpO/nc+IFkjR6P
	n3yxddTYCfiATjb7JsPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqC-0000000Eytk-11VY;
	Sun, 01 Nov 2026 22:15:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq6-0000000Eymj-260v;
	Sun, 01 Nov 2026 22:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=e7Xd2E8Pqzn8FccF1WIpaz3JmDCeqSOjK2ia1Sxg5as=; b=KymEa+OS2KVEyqdV548ljX+ZW5
	Gmi7am9nTorgrj3npe8rlLyXGgIMqF50d/sEiBrQGeMcpdpQ+4jUv6JCToW2f49o8vZ3E7/i+A2bp
	EB5Rh1NUybWcb/4vBFv62v2PTNZGL5/OfmGHr0Lm54eziHjyvCo2jDQgOeOplwHX0oV8ILCmi2tZ7
	Njs4v3JrZ64KenYFn6hoQaCoKzXyBBioSwZV/NpNzV2IW2HdI6Vi1E5btV2a6DuRT8iN0b/DzxZvB
	C1sJfia4fy6MPDlMO7ffw8leJ4fuNSy142aFwwvL/WLstEEtAFnL/M0j+lHtyPBTZzFhaqkZBAXYH
	5cD6t0IQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99
Date: Sun,  1 Nov 2026 23:15:21 +0100
Message-ID: <179357131390.4107717.12383201586737412439.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807112432.49685-1-festevam@gmail.com>
References: <20260807112432.49685-1-festevam@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141546_563577_AACE7B24 
X-CRM114-Status: GOOD (  10.09  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 07 Aug 2026 08:24:31 -0300, Fabio Estevam wrote:
> According to brcm,bluetooth.yaml, the correct clock-names to describe
> the 32768kHz Low Power Oscillator is "lpo".
> 
> Change it accordingly to fix the following dt-schema warning:
> 
> clock-names: 'oneOf' conditional failed, one must be fixed:
>         ['ext_clock'] is too short
>         'extclk' was expected
>         'txco' was expected
>         'lpo' was expected
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99
      commit: 54b2405a6a99b049fb87023a6f780a825f3b456b
[2/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-leez-p710
      commit: 7736dd0bb7a1c78728d68880f4f8ff033fb7b83a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

