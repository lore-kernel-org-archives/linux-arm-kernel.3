Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1BED6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWBS9aScdR6D+NEblJxoeaGWLTaC7n5iTgmxM+tXxIk=; b=k6cHzUMcTOfoj/SyPS4+H/jJN+
	fgv8WBjUffOjMoy/FI+8G5lpqEOwPi0su2T7FBirMYTNJfWjWu9uwf28Il6Bhv55YbbcFzTN73zZQ
	/cXq7QLDVX0OCHhubYXudKweGk75m9BUy/5qOprZ75U//C6MHBfuE2amt0hMjHKyaoLzVE5fiEtZm
	3B7yNgsjPx/aXPkWuLRxIrBzC8YvcpnjDmYRfIdNxQqjH7pOdTC3tsfJkA16ByY9RtH+UryjH2/8S
	3Gjk/x5EMxH31pLcOA9NtQOjvzfHHCrd+gjDtx4IzJPKmzKbLrF3sQROMHrgj0IA/W9ZYp/rCojuL
	a7ySWwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgaa-0000000Epzh-2lnT;
	Wed, 20 Nov 2024 09:01:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgYt-0000000Epcp-2Dbi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 047D75C55CF;
	Wed, 20 Nov 2024 08:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E937BC4CED7;
	Wed, 20 Nov 2024 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732093186;
	bh=OPxTtvi9bEw4jt5RVpouDO/nbmR61bu/6KIe3jgDYWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LO4hbBPhN7wipq33TWL7xfJXJl7Ur+4M2+kfkGL/weB5onfT2Wt0z76ycZ5g/mvF1
	 cYoQjD/ZsUtOvIKYCxEPMcRm3VfcEyHcdEcSdbZQLVA/L0GEv1DjWoSS4x/L6mREj4
	 8eSDSoCL/mJawiZqZtKTi34YQ3eY4RmVIACVY1oGFbYRfvdlkqpGyxseIJ9LdLHhCC
	 h0LWYuthg49LxsVbi2uPGJDq/btAdCT6wTTMoyaM2XbLNxWWMusJEUnVJaauJn4WgR
	 jO9IRmr+PO1jUwnKq8IDKiAIhBfUw+M68EAWObL/AvhwUPkhEo352XTI2XXpQX3Jmr
	 AG99BupmZRLEA==
Date: Wed, 20 Nov 2024 09:59:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 03/15] dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT
Message-ID: <szwayqsq3zw3nc37fb3comys2wj5vdtv6peb7icwne4cxnraeb@uzpq3oxbhj6b>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <01cf1bbae5949cbceb2768f2044377bc2479986b.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01cf1bbae5949cbceb2768f2044377bc2479986b.1732030972.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_005947_607237_6EC9C310 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 09:40:09AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add SAMA7D65 RAM controller, PIT64 DT bindings.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Missing SoB.

This applies to all your patches probably.

Best regards,
Krzysztof


