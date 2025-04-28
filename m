Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28F7C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD6ZTcBbZ4U6DFH/9WyStRYKsx/zCoklNoMWN/P14xU=; b=aencwp1Fey5A7jRhfiQvwRJBPz
	TbPlu3Ppeu3UThYgMTL6DpRztLvUCimmYckLnx2Z84V3yXaslNyz4u5/5o1LAsjQ9i6KTMpyRvWuV
	C64jIqJTpC08cSWUA3W9dl7MksNrnTCiSu1Adnt2k++cYaIzFqoZt572mpheqZuCU+OvJyzR5gTXu
	d6I6T4j3ShxzA8nrS9KPxdsD+jyxNcYgl5XYVEUwY/UmDDnxfotV1M/vW90yMiUGnoYxElbI9cFSl
	t5SpFBsz6iP7juiz3SOcdMbvrlqAgiQJdDjZMFhm/lSTuYL90qeWRPqP1gfQf+RkX3V/wUbRZ8BOE
	dc+pOCCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Uf4-00000007PAJ-1ntA;
	Mon, 28 Apr 2025 20:01:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9S0K-00000007374-365K
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 17:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TD6ZTcBbZ4U6DFH/9WyStRYKsx/zCoklNoMWN/P14xU=; b=b9z41P3uUYYRQTisPMvmx95H2Y
	yQhukQ6JzllPEWb27LjkVUcRsMjWxf34DkeWy1B4CuPPlrRUP/w6fQHG50CS8KttvRaeKXn7Mf1Hd
	J93DwlWd/wAIzuGFGgVSTf7r6DVwyGA/gYrGh7W2IJxQp22Tf/s+EYQLLiPd6s/ZfH+VID/brHZ+c
	EFmdUIsGGU7XUf0UOq0xCCHuwkb72yC4e+aLX6gDYPk5Z1P4BR6uuPqbDLqFhQcfEfu6yUIVS12gP
	kMb9Hep6tcAqD2uabUssH2O5/P2Bd5ws3jDMpv0cFtkm3+XBLFuv1i/tVydUXcK/99Mu0iaLStO1v
	iFgH63/g==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9S0F-0000000Cu7Y-0iym
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 17:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 877D7A4B0C1;
	Mon, 28 Apr 2025 17:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF00C4CEE4;
	Mon, 28 Apr 2025 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745860245;
	bh=5AgkR+22VDjIBm+J00qc5j3ln4mZEAFE46+wzRtBSgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tY3G8aUU7JZKmsYWpxRE1JAAsUEtYAgG3SSxEKSFzK4Q5ZNILSy/8AXziYAqsmV6T
	 CAWnasTLDNL5BDx37i72roQIJoULZbs27Kw1vmZXX1gAvGbsgIQN6bSmNM2/Q/bdQ3
	 OuwV2QlZ2uc01mW3mdUvK5A7+khDu+oI7lCc6zO8=
Date: Mon, 28 Apr 2025 19:10:42 +0200
From: 'Greg KH' <gregkh@linuxfoundation.org>
To: Faraz Ata <faraz.ata@samsung.com>
Cc: 'Krzysztof Kozlowski' <krzk@kernel.org>, alim.akhtar@samsung.com,
	jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, dev.tailor@samsung.com,
	rosa.pila@samsung.com
Subject: Re: [PATCH v3] tty: serial: samsung_tty: support 18 uart ports
Message-ID: <2025042829-heroics-deskwork-e74d@gregkh>
References: <CGME20250417042427epcas5p2df3d35803adcb24da7d83e5df586380d@epcas5p2.samsung.com>
 <20250417043427.1205626-1-faraz.ata@samsung.com>
 <d350841c-3560-4511-a866-9490737e48f7@kernel.org>
 <06cb01dbaf5a$1ea1a8b0$5be4fa10$@samsung.com>
 <2025042508-statute-pleading-df6f@gregkh>
 <0ce801dbb837$19706530$4c512f90$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ce801dbb837$19706530$4c512f90$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_181048_170642_394DFB23 
X-CRM114-Status: GOOD (  17.17  )
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

On Mon, Apr 28, 2025 at 05:44:21PM +0530, Faraz Ata wrote:
> HI Greg
> 
> > Subject: Re: [PATCH v3] tty: serial: samsung_tty: support 18 uart ports
> > 
> > On Thu, Apr 17, 2025 at 11:02:24AM +0530, Faraz Ata wrote:
> > > Hello Krzysztof
> > >
> > > > -----Original Message-----
> > > > From: Krzysztof Kozlowski <krzk@kernel.org>
> > > > Sent: Thursday, April 17, 2025 10:50 AM
> > > > To: Faraz Ata <faraz.ata@samsung.com>; alim.akhtar@samsung.com;
> > > > gregkh@linuxfoundation.org; jirislaby@kernel.org
> > > > Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> > > > soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > > > serial@vger.kernel.org; dev.tailor@samsung.com;
> > > > rosa.pila@samsung.com
> > > > Subject: Re: [PATCH v3] tty: serial: samsung_tty: support 18 uart
> > > > ports
> > > >
> > > > On 17/04/2025 06:34, Faraz Ata wrote:
> > > > > ExynosAutov920 SoC supports 18 UART ports, update the value of
> > > > UART_NR
> > > > > to accommodate the same.
> > > > >
> > > > > Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> > > > > ---
> > > > > Changes in v3:
> > > > > - Fixed review comments from Krzysztof
> > > >
> > > > Which ones? What changed?
> > > >
> > > While sending v2  change log was missed unintentionally.
> > > Added missed change log in v3.
> > 
> > Can you add this properly and send a v4?
> > 
> This was a clarification given to Krzysztof.
> The complete change-log was missed in v2, This was pointed out by Krzysztof.
> Added those missed changes in v3.
> Do you want me to add this clarification as well and send v4 ?

Yes please.

