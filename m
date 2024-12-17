Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55F1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7aHlY/jR3p/OHOsLBECq3vFiL7uke/OlabQyWVaKIo=; b=I7TGEiMKvIhjGV9goTb3JYTCBZ
	Gbv+fiueIle+EN7vjigeIw2IGgB8JErKAMffAugmvoUenBEbhOhkwZBwPTAnEdH0OkIhzQS9ZHuah
	82QEyH46syK2LycSVXJZzalLy2AmK+LEcs3TrzegEmQBY3AZpwY4bOz0AovZPTg+fNTFMNs0YL4/U
	nfCZI87MFlgBF/HtHB+yHGGTAQiH6X07T8HhYw+qD/GPEYh3deQ9KDIlxkAthq1L22j4aE2CO8G4j
	6BDTCxlAb5lRX3LOwLydXzh0hMF1j21CMpbgAWb8ASb8JJu4eq3kQHmqN8B4SOliZUorRTA/LRE84
	WW772N/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZb5-0000000DyZX-0IPo;
	Tue, 17 Dec 2024 15:34:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZKr-0000000DvMB-1xvZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:18:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4F605C5F99;
	Tue, 17 Dec 2024 15:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220CAC4CED3;
	Tue, 17 Dec 2024 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448688;
	bh=kJdbCSApHTGeLrjLWjlJ37Pv4MTdyLTou3Eas8n6+CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evm6DoKhGbtnN66T2rGxebwCaMPJN5wCUQnzDzcYi895uShtuKFsIQsmI2Posiwsm
	 Ss62qsZnNBsMju7aDSNxrnkTaluO26XIfYRl+c7K8ElHfWG5Gio4UD+C7GhDQzSGBj
	 DXst+ypL9PwNDq3STt7UYpGkmFP0/kA4IaXCjPO8deHZNjUO/NSKqsSN2z8Oopa3JK
	 byA7ZX5/6s992NZpESNySQABxKOPGRCVbPHsApL1QGmamhgYVIb+2vseCwcwq7wH2k
	 Q59Y21EEGYlofpJgHXG+p/gqk0aUehbBKVxDRPjkfEY8zC/i36nV4l5LyxxwZm/YQs
	 yVUK23SLtroKw==
Date: Tue, 17 Dec 2024 09:18:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>, jacob.e.keller@intel.com,
	UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	robert.marko@sartura.hr, linux-arm-kernel@lists.infradead.org,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v4 9/9] dt-bindings: net: sparx5: document RGMII
 delays
Message-ID: <173444868627.1811657.3055323155605621690.robh@kernel.org>
References: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
 <20241213-sparx5-lan969x-switch-driver-4-v4-9-d1a72c9c4714@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-sparx5-lan969x-switch-driver-4-v4-9-d1a72c9c4714@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071809_553948_AA4EC3C4 
X-CRM114-Status: UNSURE (   9.79  )
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


On Fri, 13 Dec 2024 14:41:08 +0100, Daniel Machon wrote:
> The lan969x switch device supports two RGMII port interfaces that can be
> configured for MAC level rx and tx delays. Document two new properties
> {rx,tx}-internal-delay-ps in the bindings, used to select these delays.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  .../bindings/net/microchip,sparx5-switch.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


