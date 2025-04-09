Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BED5C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+0NHHDsdRkH0yVlXplz9Zqxe5uiP+uK9ulf49CPcJk=; b=L5nNZIczeCJU0Bl13aYaN99h6I
	ZLjuvw6z1LHDzYbj2IEbyHEh3D7YF19QqJO9t0mAHYQP89oVmxZOosmk/7UP5AHY8dZNBi596VjPT
	+G8CZ8M1hwPqZznBdDL55O+PgfkIpUncs4aUc5cWA+CaVMBwBhSXzohNVNAnUTSSRqN0xv0iqmceP
	xa8Ruzm6lCOjQyDfZoKYpOCN9G6BmDhKpT430AcBqDtuK48W1QWzCxC6pKYkZ7SqCDD0KIavwD1n5
	ADM1afOOLN3yIg5JA7ZbExNy0jHQfRB6R6xdh79HcE+gcn5nOOYvrjZRi7ynqyI1yQ8msY5laoBgz
	cgWDtc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qhi-00000006ZCO-3gkE;
	Wed, 09 Apr 2025 08:22:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QT3-00000006WTR-32Pu;
	Wed, 09 Apr 2025 08:07:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2AEE65C54E7;
	Wed,  9 Apr 2025 08:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50C5C4CEE3;
	Wed,  9 Apr 2025 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744186048;
	bh=tNluW/24rMyIOMJea3X50pjI8OCgeby0BZTQU82vJ6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fGFDyZu7YseIGrQ53Az9pAzLGJPuaIdJwrezIAZP5Z9wBzSFDJOs7+SbLGXGCZaIu
	 AYR1O0yryExF++M8usY8FwBv7yowUMl0VLx7NA4japM40ZJw8rsOT7rNz35MgWMGoP
	 hEp+xBBViqq2ygD7/e4Mb9meqdtGCKHM7SkrusB1nA6VNGGgqp/EesazTAg6KMi1BA
	 l1I42dCpFg1OEQqqkHtectPSNUVjKE2iZ5HIco9txeMw/p+I6LMKi27H1Pbc3phCme
	 YlrTEanoEKExCPLsmBc76UhisYK/4X3udbQkh0nmcgR6P04MjQC+JWL74ZGk4WJ9NL
	 aVj3+f1M0qq/Q==
Date: Wed, 9 Apr 2025 10:07:23 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: rockchip-ep: Mark RK3399 as intx_capable
Message-ID: <Z_Yqu83HCb_bYKIL@ryzen>
References: <20250326200115.3804380-2-cassel@kernel.org>
 <20250328122123.GA1187318@rocinante>
 <20250328123614.GA1188225@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328123614.GA1188225@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_010729_804521_99F1B0DB 
X-CRM114-Status: UNSURE (   8.40  )
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

Hello Krzysztof,

On Fri, Mar 28, 2025 at 09:36:14PM +0900, Krzysztof Wilczyński wrote:
> 
> That said, Bjorn is preparing this Pull Request, this might not make the
> cut at this time.

-rc1 is out.

Any chance to get this queued up now? (So that it doesn't get lost.)


Kind regards,
Niklas

