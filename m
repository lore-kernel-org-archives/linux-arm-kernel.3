Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBF710A62FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dF3fC2Pc1J5FXgAvNPiHACy3LkzghIoVHmgkzv4SFi8=; b=QpCvpcLoA6djYHI4Hx7YRMoxjN
	IhinDQF6b9OUZfJSY0A3AMJnZ/PFrNDjEA8ogkv5xXCogEYl7ORGEtmYz157EessL/G1vlwil4++r
	DXEct+DH4g4htZvwHJbx31GY/LmYhu9QDMlbebWoH4xOOSv0QL89ym04ogBc3fyzKfn1/M2Tn7R6b
	4xElDoVrf+Zujq2NciuiaCS+d0l+AlWq+uGrAa3vXqCbNy2B5Vz8qSVaMXVYjGdtXJbv0rSI/86yI
	sw4PNvnWAYv6VE33RlrhJLGSomUxUDPDPugaS+4YjftsR6T9Ib8To3k9bPGfWyhRsFT50Za7pxvJz
	jrdYvGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5m5R-00000005hC0-3PJx;
	Thu, 26 Mar 2026 14:53:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5m5P-00000005hBe-2hoR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3E1640A0B;
	Thu, 26 Mar 2026 14:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98266C116C6;
	Thu, 26 Mar 2026 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536806;
	bh=JskL5xnhwWFHaEenp/2RuGMXr1FMLRJRU6ueR9QY3vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmRvcq8+156F4isswv49IFl/NxyXBTsW8Jwg0ob6oCwecqEMDKQfmmrH4cdaalwh1
	 3LzjANvoInf0uo90/QjJvWzSIQPi+8Ejib3w+kgB9jJlPNWAZPLmKy3b32bL9+ovfp
	 p3A/dIFjbNugUZa8s32ZUXlm/QA+l+ROtzlxQhZa67v4lidJrQeSJgGO0JilcQRs/v
	 YsOlrkyNwrP874y+BmROKaQraGgqBQSO0RW6uVbEjwJ+YPIkqN+bijzvsxjmkJeTnt
	 ROOzT2V+SbL87XkhBZSKB8OI41u4qcL/COq1/wpOgaGo3H2vZhise+5kZVhhfBShf6
	 huPC3XBaTtzrQ==
Date: Thu, 26 Mar 2026 09:53:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: remoteproc: k3-r5f: Split up memory
 regions
Message-ID: <177453680287.2360004.8754104483766299234.robh@kernel.org>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
 <20260318-topic-am62a-ioddr-dt-v6-19-v3-1-c41473cb23c3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-1-c41473cb23c3@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_075327_708300_BB21D68D 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: Nishanth Menon <nm@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Wed, 18 Mar 2026 16:13:07 +0100, Markus Schneider-Pargmann (TI) wrote:
> Split up the region reserved for the firmware image in more specific
> sections to expose the full fixed layout. Especially the LPM metadata
> section is important for bootloaders as it contains information about
> how to exit IO+DDR. This is read by the bootloader but is written by the
> firmware.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 29 ++++++++++++++--------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


