Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E66D3ABF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN5reJAfkPmvv29BmwNOeosgSTGROQytaMQJ9LCzzU0=; b=HD+i/KUdQglw5hy/nS0vjNnV8+
	5TEZvnlwJgww1sTF4L3JNBfirOWSkkGajneGk/YfR24qBt4AMOTSwdddKWvKOgrDMQHMgbKaezDzb
	xPNyWcwrRzkVE6lgtTNmgDmoUW/La7Ld6pef3t84JXrzbeFqZGmqy7l+k8c6SsdE2BshzBT+qfkC2
	apJ8L6T20+3bmQbG2CD1qkSYxlnKSJYVq8hj5Bx2Z6ABnN2rtLpStuGIFGK9vgvrMzAPwnw3h6UuF
	OtD9ktQT0v/OlyaM1AGvv+A3RFIAgCklPV8q29eOP4v9q+pLtqyvL7S7TCXF0fIgwu30WfnSDhEhT
	0u9lVM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbwb-00000001N2S-2Ipj;
	Mon, 11 Nov 2024 21:27:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbtg-00000001Mon-0eyQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 Nov 2024 21:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oN5reJAfkPmvv29BmwNOeosgSTGROQytaMQJ9LCzzU0=; b=evbrzn3hDaJZVrkM0c3NPsJTyS
	atq36OJBuX6awKHofxRlO1jvVZ9UgdpsLrVUvhJI1ocPPIWExfmI2CZuEHrcItASWHlkfn1rJWhad
	ShXDJCbPW6dSiJaz6llOICY06qXmKcCbB/FKm8zFtNvYQOmHqLwj+OhUjhrvnJNpuqIqKwI/4Sh9D
	em+CRgzfKDQsxO6VE/C7+wpc+JE45aXptGL8uP+YVopq5sHZAMYUfi09qCypzlzLzTcN5pVFzGbJw
	awTX/f2l7DSXF0VJoEo/W/i+Uk6mApTSdpOnUnpw/rvvZajkJOc8bAM/4+tXeMOTnG0ie8adGdhaX
	lEtbE8SQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbtc-0000000CuzD-1NUN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 21:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 405BAA40C53;
	Mon, 11 Nov 2024 21:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC7FC4CECF;
	Mon, 11 Nov 2024 21:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731360263;
	bh=HB0kuKAWWrMtuX07WkanXAABx99ZqOF5K/K51IvRFXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2XSLsWunbbgzyrqIeKSnRWpnnnj2wEztJGI6Hs6ag6JdtphJvDIbem+CxOvUYw0+
	 wnt0eszF8GaRQFSqa0bRfmhnYmYCeB/sDIEmQerakDSzGRcwi3tiTdCxf5OIUpmit5
	 Usp0j07alJ6NIAD0Oq0ky55uROVUtUYs3iwY+I4JsTmYFM221qMbNs8lvVvDNRlQ5P
	 enB45y2icTYwxXHVhq+iK5aenPUZA3Sj8AsvluYr6ScHEfrhBX8ndpbmbRts3eGEa/
	 sjnxMC0SEXxX1ofVmRjxhrooruAiKq0T4KbFL1aaRSOnS5RI8zP0EENhdGZRTCovj+
	 Q/SvU06QCcsNA==
Date: Mon, 11 Nov 2024 15:24:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>, Hari Nagalla <hnagalla@ti.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>, devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: arm: ti: Add compatible for AM625-based
 TQMa62xx SOM family and carrier board
Message-ID: <173136025956.1976607.11893890247843400314.robh@kernel.org>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
 <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_212428_656751_46B1006B 
X-CRM114-Status: UNSURE (   9.44  )
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


On Mon, 04 Nov 2024 10:47:25 +0100, Matthias Schiffer wrote:
> The TQMa62xx is a SoM family with a pluggable connector. The MBa62xx is
> the matching reference/starterkit carrier board.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


