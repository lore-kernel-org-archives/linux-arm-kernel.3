Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8DFD5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg7+MAqBbkvVPj3c0oyonZzZrN7j0BEGCa86ICkvAo8=; b=4sLSC+VuPATlpjSbKZ7t1XaqN4
	8TnhWHr0og/4BaOxq1NJVDLIHJAp+O5tywRJ0HCY3q51dkbdzK1uogmSZub69fxLo2yn3xLEhcLZ2
	ya72YTa7IIQns2pxUU/n3HA9O1yvhWmkzUawPxF4sxGiQ5IzSdcYsAfUFY5kSkknx0wIG6bFg5kFi
	kgObG8omYm1O6OvZ8f+wSkzXGmp3vTuh7bW/WQslblsZQU2DpmNrmjU2gj8GmUl/fCb8N/vAC5owZ
	Te1KoNTfrKktWrn5aV1zYCpuTS66W5x4ppGe5GHKQ+eSS8g7/Dg5ho+jA4v3Mk8t+RADgSNYXyviE
	ikH5r+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOY9-00000004mrV-3UHN;
	Tue, 16 Dec 2025 06:28:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOY7-00000004mr8-0rzA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80EA4436A8;
	Tue, 16 Dec 2025 06:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D341EC4CEF1;
	Tue, 16 Dec 2025 06:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765866522;
	bh=Kg7+MAqBbkvVPj3c0oyonZzZrN7j0BEGCa86ICkvAo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTgQkNahVr7LQuzw7D15rFEq9pIYI/fYs4Lu7M+YkigOTSAmOXl56UqLENZEK5jz7
	 iO1mp/jXm+tIVqLTAPQcpd0Of48XSJRMhWDBHxA8vPZDlco6PhbJmsQmkpYlE8i3vU
	 9FNRlh/KrvddGs6M1tjMbZC9HJ0/0bY7/81imP+w+XyLjmbqrTOQ/wINyKD+1LVOzf
	 bGtT9oAoqZ8u+h5GckXKagBOGaEil8UUYLhvrpfbXO1EztTbUinjCa1qcPHCZNORdt
	 2WSUK6hTVpLCw7jILi3MIQ4MB0/B9xcS+wYuftl3Iwg6bpWtCIBC4MAN5zK/Ra20GM
	 GSepG+Z4gm+wQ==
Date: Tue, 16 Dec 2025 07:28:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: fsl,imx-gpc: Document
 address-cells
Message-ID: <20251216-placid-speedy-rooster-ffcfe9@quoll>
References: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_222843_264434_861E9294 
X-CRM114-Status: UNSURE (   7.63  )
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

On Fri, Dec 12, 2025 at 09:58:59AM +0100, Alexander Stein wrote:
> The GPC power controller is an interrupt controllers and can be referenced
> in interrupt-map properties, e.g. PCIe controller, thus the node should
> have address-cells property.

You could say here that there are no children, thus using value of 0.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


