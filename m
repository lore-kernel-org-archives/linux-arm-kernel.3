Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A1CFF60D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmnoTTBLN8PO+sDO7HI+E9Pr5A2qQSMLMIusL9AAp7c=; b=1E1aBznLZjYrEP2sveViFxUApC
	56UUWSAxNkX0xxnpDbiSor0eDvP6DlMVIdOLvekDd7AAlaUj4kNew0TgRtAV+k2/60JWPC8/jLpMI
	u/9gsDJ/ej8oijFV7VBPzeh4tWxuUXYDchpv63ijXXy6K2gPMY8oAgGA3df9Q6bPgSnNcM/4MLIze
	PSeDn1ln5t5zLnV4nsH0lUsGxIOzq4FR5yNPDJC3zJ369/4rzjG3nWSjaxG5K1KILei3A26cAmTh8
	uee8cg7PjBipCsVNrTozllBGaf2m8Jplh84R4OpBcYsdIxgSzt3RloRqVElXYvFCPfQz9qq8EjGj5
	Ruoa4Twg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TQs-0000000CTGf-3LRh;
	Tue, 31 Mar 2026 07:22:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TQr-0000000CTGB-0qOe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 07:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LmnoTTBLN8PO+sDO7HI+E9Pr5A2qQSMLMIusL9AAp7c=; b=pDz2aN4Z9cuLz4qjfuMwA6LB+O
	eg+rT0M3qH6sJGBGF3peAXoAignXSVelm7fRleWRPORfoddiPPBCNtynMq5O6sY5RzkNan6BmQIO3
	r5/9gwEaNHlqdmKGD8IJnqm5ZR8K6vhSBLq/g6XVt7DR2BqFXelGUv3nJyfjFg+xp8r1+enbaNfDN
	e2BOCx/cKY0x9nuZwk9jXc10huzVmK3kRqDf/FgtoYXrCmryJAAXTEx53sEzPnQNHWLbXbePgv390
	lHPFjnq7lNDesVfmXiKaCvvNHF+zR4bDWewWe555mA3p5SWlTYHBUYZzGkEJMd+aFlFIuEP0S5zSs
	le9MsjAg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TQl-0000000FHFs-3yuf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:22:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3790340AE9;
	Tue, 31 Mar 2026 07:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827CFC19423;
	Tue, 31 Mar 2026 07:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774941750;
	bh=3epPlehlc3uNOp7La9rWzBwZDIqolRKO1QRk7N2tNG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFmCheWUiKtaDslZfGELlxYhixl1aPAcQomQTdP7jweoel1WYk/Ue2O4gnEroa7TV
	 SM9ZFmv1h85Fkb3YYJ8YnMbbYA+8WoEIHogH4HlAuGBWeHZgHWjmMFcNoITFPaykNc
	 bHFRIUUwkuiZ8Sr8dBndwxkb2kJfyOR4CF2QJ5k1nWHOgeIfAEGJ7JHXQDxS8eFEWn
	 Mfe6cJj6g0kYWIJV0ibgu0aY7VgkSmB714MkMjFs5fVszOEVvtEwCexj1yYxKqnoxU
	 x+PaURyRuJg1wbqg2nR/MvpDMXx2HMuxRnGqu6DoOqCmZLcvYt5AxFtyfWKRGMjFZ+
	 ZuX1FnvuXVatQ==
Date: Tue, 31 Mar 2026 09:22:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ulli.kroll@googlemail.com, linusw@kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: gemini: Rename power controller node to
 poweroff
Message-ID: <20260331-majestic-tuscan-woodlouse-7c0ed1@quoll>
References: <20260330110135.10316-1-khushalchitturi@gmail.com>
 <20260330110135.10316-3-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330110135.10316-3-khushalchitturi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_082232_537795_B294F3A0 
X-CRM114-Status: UNSURE (   8.14  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 30, 2026 at 04:31:35PM +0530, Khushal Chitturi wrote:
> Update the node name for the Cortina Gemini power controller from
> power-controller to poweroff since node "power controller" is
> reserved for power domain controller.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


