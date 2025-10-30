Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D38CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReC8ajN7zY1bUt0lBIXxf1LJQMNxzemAhvatfavtR24=; b=2/276PN6vj09ndYQA0zfhBfmq1
	Q6qDpCHnlYnW3poyA1Clxz7ed/9f5MnV8AeR5OUCJVXG+TD/0uchil3wV/NarIA7bm+ojp8dzYENE
	bc1UtvJf6cboV2po3v9yBzW2oxFzx54OlQITdUx3bkXilbdDI2G3oYStXhRHe/+hFFMcANp4c3xiO
	/MUWgWdRnBk5WVkZBv7wGYtK48FHXBYf+yQsaReuEYx6/X5VZ8bFjJXLrcn/gxmi14wyMcFaJ6hhH
	saNc9pv00HkTLIYqOMUkSEIeA6GQN7NKTXgW3jae6ZNRvUeuf6qmTpYSNJ66T3dvE7GyYCERv6FS2
	hysFHd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVqB-00000004UQ2-45Ud;
	Thu, 30 Oct 2025 16:49:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVq5-00000004UPB-3jpT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 317CF451F5;
	Thu, 30 Oct 2025 16:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DD5C4CEFB;
	Thu, 30 Oct 2025 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761842969;
	bh=7VQ46Vi+I3aZ0Fv1Chak1rm/T77YzQd7N0m61VOYC0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtPn/Clr354rV52c6Q6wMLQQdsuYH/7nPFqC6BrjTspxq/uLL5JeZd7xR95oNllUG
	 pk3MN+B9ZV8GKITZxy4a3BgKY5ykqXBlCXyB7U8dVoya5hBfO3xQPS56lHCy6O8GWl
	 FaQ9n9XKNd5as2r8qt7hlEOQ+iCADjC+7MipbNCi120NMgzi7wJbdOWpRhitS7VDBl
	 u4YpA6ghe7TjEGJekPIidK1D5ck8fpHpdN1XqQ2L/SQGRumcaIGxgjdosSZ+7DZ2b9
	 h6q2FB09k3/Ttyq5C+JehIcJ7r+6V+ZApYpAIB+JsC9nPknptFAFLEQgei2G+uFKea
	 r4gklLP0mhw1g==
Date: Thu, 30 Oct 2025 11:49:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Takao Orito <orito.takao@socionext.com>, linux-mmc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mmc: socionext,milbeaut-m10v-sdhci-3.0:
 convert to DT schema
Message-ID: <176184296394.4162219.4477625887711205247.robh@kernel.org>
References: <20251027-milbeaut-v2-1-9e1954ff7708@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-milbeaut-v2-1-9e1954ff7708@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_094929_945530_2E4FD302 
X-CRM114-Status: GOOD (  10.37  )
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


On Mon, 27 Oct 2025 16:46:16 +0000, Charan Pedumuru wrote:
> Convert SOCIONEXT Milbeaut SDHCI controller binding to YAML format.
> Add a new property "voltage-ranges" to resolve dt_check errors.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v2:
> - Change the description for the property "voltage-ranges".
> - Link to v1: https://lore.kernel.org/r/20251023-milbeaut-v1-1-3e4ff67110ad@gmail.com
> ---
>  .../devicetree/bindings/mmc/sdhci-milbeaut.txt     | 30 --------
>  .../mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml     | 79 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 30 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


