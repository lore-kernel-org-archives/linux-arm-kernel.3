Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E9CCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBaNrFtzV1um4Me5Tpg1enJM0ixQW/sviG76zmSSrQg=; b=GqGCorwM9HSdy5NVPFJnR8u6TZ
	Ulbw7dNyOjh5bX4cueZfGvYlQA5ZO5U3Hu/sui1yRjVweNDplKnhOuHSceGSP/lOWRM0TOeHk8u1H
	e6PcueixWFUkqHj85Je9osQs/7RpjicdaGN5TtBrES0kBBKf7NyB8nNqJGlkmkfaTuTazGm3CBbOC
	14UVIBTvmPi18875JqE6gN3xMioKCyqB/jBBTtWBjSJX/g1pngp31BSNWEwN/fr1wZyiveUXm1j6x
	kmltXLSSxFzWAI3wUJNMjSR4ovq2bdwKhvHkekq8DHcFIzLbnXI9lWvylxzwSMLP3pp0xVnBv6cJn
	YL2UJhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEktj-00000005i43-0DxZ;
	Fri, 31 Oct 2025 08:54:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkte-00000005i2M-43Sa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9436540BD3;
	Fri, 31 Oct 2025 08:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0ADAC4CEF1;
	Fri, 31 Oct 2025 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761900850;
	bh=Lw7yF10xMLzuOE0JXvv0x2sq04lm1fFuwSZpHCOq9mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7+hjfxtbZHKoqcFjOPoLfaXzVymj6iAzO+1+my+UGN9xQzo2tbNW0nIZ2hVNb5mz
	 7oe+qGdpTg/PDFq7EJD3H5eyhEfTwTGX55+0Yt95ZIyKHPI7hN7/43Ap3OrgOPtmTO
	 n+JG7SR6NfhvVrfb7HpyQJzeFHTjfGuv3yQTKqDuVU+/U7WnzDkQyj0hyC7iZzvvrO
	 g2dUM5EqkWRGV1s8VcxVUpbTjgp3IUu60ALra2NYWkb1kQrosb2ppgEDxRV5ARZrVA
	 7SXhjjIBZK8Zyf5I6fNO0T2IUpUkN/OEDoTHbLICjWUEG9WsrJ3/K77wpMOsdjCIsX
	 5b66IiXsWzOKQ==
Date: Fri, 31 Oct 2025 09:54:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: weishangjuan@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com, 
	vladimir.oltean@nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com, jan.petrous@oss.nxp.com, 
	inochiama@gmail.com, jszhang@kernel.org, 0x1207@gmail.com, boon.khai.ng@altera.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	robh@kernel.org, linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, lizhi2@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH] dt-bindings: ethernet: eswin: fix yaml schema issues
Message-ID: <20251031-enthusiastic-rugged-aardwolf-a5ceb8@kuoka>
References: <20251030085001.191-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030085001.191-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_015411_368667_54C172E5 
X-CRM114-Status: UNSURE (   7.98  )
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

On Thu, Oct 30, 2025 at 04:50:01PM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Due to the detection of errors in the eswin mmc module
> regarding the eswin,hsp-sp-csr attributes in the
> eswin,eic7700-eth.yaml file, the link is as follows:
> https://lore.kernel.org/all/176096011380.22917.1988679321096076522.robh@kernel.org/
> Therefore, the eswin,hsp-sp-csr attributes of the eic7700-eth.yaml file
> regarding eswin and hsp-sp-csr will be changed to the form of:

Ach, and you forgot net or net-next subject prefix, depending which
branch/cycle you target. See submitting patches and this subsystem
maintainer profile document.

Best regards,
Krzysztof


