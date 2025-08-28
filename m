Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BEBCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejgAoQmKs84Ohgul/dAWlNj7ouyIBeetp8tdGLe7ivY=; b=PzKM87JMI1yV4aDJNnICuUU0d2
	1AzBqwjNSylLnvGVB8SrI5cKYhvf2Lf+2wyUpnfwj555i1sh18Nwxz99LRZG2KMRda+mYoK4ODMHe
	KamYPpFiUZj5eH94bcUOzgs3ojNaXDy5Z/BWpfLFrPiqPgPqkGY0mlyII661knxYUEyxPdfGcKQit
	FJR3xzG3bYboa/WiauCJ5WzTV5amxM/5LcrxEdiCWGVbQ8XOzctOL89HmuwFBTt4eKyhnbbYL9o8y
	FgcKA5CGvJInHhZSUhFDr2+EVvUKi0VwFVU7b87OqxsiBDg+nS4OvhchSry4IGFNsTygaMuWPbaf4
	2MW9QrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNy-00000002Spa-110c;
	Thu, 28 Aug 2025 17:26:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcEe-00000001efi-3sJo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38D33600AA;
	Thu, 28 Aug 2025 13:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F0EC4CEF5;
	Thu, 28 Aug 2025 13:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756386011;
	bh=rX0j8rIu7l1wKKVnMUgdtQN5WgVXsm2ecMpja6Lgwos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrHdgpmxiEiN799FqNTj74ysbOc87fJ3Jd97uGB8oKnEXqJR4K+cmLP0lwF/NktKQ
	 ORQ4m7i57lSYQZvbvfZEpQUHptwdYHXlOKTOfAEuvqHnKaSRQmWIrADPICVvfnW/zm
	 J8koj+uCjYo9XzRA5Bm7tphKL9k/EyA7jOrxaEG3IgS/9qV11iGXSmo2hWCM15JN8G
	 ffHQK57wBNPG0liccYzGGyrgOQBUoFteB13Jq0Whnw5n4Z6XEaLyjISincIwW4E67J
	 fTvQFuNOlDZ0Urab+n3NeVEzvRK6emPQFghhXw9cp0Az6jZdDS+TB9yFckTJzwNciY
	 P53urWk7SYuAA==
Date: Thu, 28 Aug 2025 18:30:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	chaitanya chundru <quic_krichai@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com, amitk@kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v6 7/9] PCI: Add pcie_link_is_active() to determine if
 the link is active
Message-ID: <zzrgt2dgkyap2dacmh4afg7yf2jrwohg3qkocgep3shehnzpli@4jggy6ged6pe>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
 <20250828-qps615_v4_1-v6-7-985f90a7dd03@oss.qualcomm.com>
 <aLBMdeZbsplpPIsX@wunner.de>
 <r2bhgghyunfcy5ppjcvxm746kzh7vyhsnbphlw4pj52wxtuxru@qzy7earmlnjf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <r2bhgghyunfcy5ppjcvxm746kzh7vyhsnbphlw4pj52wxtuxru@qzy7earmlnjf>
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

On Thu, Aug 28, 2025 at 03:48:26PM GMT, Dmitry Baryshkov wrote:
> On Thu, Aug 28, 2025 at 02:32:53PM +0200, Lukas Wunner wrote:
> > On Thu, Aug 28, 2025 at 05:39:04PM +0530, Krishna Chaitanya Chundru wrote:
> > > Add pcie_link_is_active() a common API to check if the PCIe link is active,
> > > replacing duplicate code in multiple locations.
> > > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> > > Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> > 
> > I think the submitter of the patch (who will become the git commit author)
> > needs to come last in the Signed-off-by chain.
> 
> Not quite... The git commit author is the author of the commit and
> usually the _first_ person in the SoB list. Then the patch is being
> handled by several other people which leave their SoBs. The final SoB is
> usually an entry from the maintainer who applied the patch to the Git.
> 

Still, the submitter's s-o-b should come last to clearly represent the history.
This patch was initially authored by Krishna, submitted by two other folks, and
now Krishna is again submitting it again.

So even if it results in dual s-o-b tag, I think it would be canonically
correct.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

