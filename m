Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A60C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLK6gwQZpSyKGups6cCyyvMeb2AEl+H0Y1r4BZi9d2k=; b=Z8FfotKO+HLs+R7xIcf/XNsHvF
	7SsEkIKRQVAZH0E2YnHSA8+qxSM37Cwc3Vqxkl6fHma6KS//91LzqJ4olREGVyydzsOUNe1IBS8/7
	RkqsT6S+u5HoYQceqL0hVI3MIcTcctfqokmmfXEAaGanef9MwnqzHEjemrvqsKTDyz5HSjO4qTHV+
	DuWF95PjdT8vH7ZAtkjPmTQxClV295AhaSCWqTMuwegncRVjGRqfXqTB1WiTKhcI8x44de02You+9
	G9IubWe7awGtJMDC8JLaX+UqA2Z8+bmAmdsatuKG6ZmmIYElenVitAj7/JpiQ1rTthorZFdPzulHB
	BCAnSjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBXp-000000061Eu-1apc;
	Tue, 08 Jul 2025 16:51:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAlj-00000005uDZ-1RDB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFD27457DA;
	Tue,  8 Jul 2025 16:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED3EC4CEED;
	Tue,  8 Jul 2025 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751990526;
	bh=GNssoeP2Eso0gHBb8ybVVDWbqf17VrAwWGD5GrJmy6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgFHf4YkTtH7jJRKpaadTtG8MfzhmmyzbI6KBFyBYEKq2PZqG+lO9LdAhSQtgRfj2
	 cIXlU9PoqkKgjEB/bVrnUnERYfWu+rFhZvvOdDa8bwLvsqwUuOsgR9qlOVtzpVdKki
	 rsVwSBbMxHArKhaLO/FmM6Y3WPbDjrzG9oyl4ZPA8jwxV0byIqz6m8258b/NiOm115
	 SsGtlepgoMPPixVBnk8Y3Dp+T4Lf10VwB3tXF45P627YUhyf/blh3km8lUJ1GNURyj
	 7BrZ4SoHO0/bLQcnp5Pfzv/o7+rH3ejyCNGjM1QjKwNY/fumYSMqqiC+/Uenl6SZn6
	 b9Ij2dPC0+UhA==
Date: Tue, 8 Jul 2025 11:02:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, imx@lists.linux.dev,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
Message-ID: <175199052372.494550.3218968445396297857.robh@kernel.org>
References: <20250630163232.2839067-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630163232.2839067-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_090207_410268_A9CA0CF9 
X-CRM114-Status: GOOD (  12.29  )
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


On Mon, 30 Jun 2025 12:32:31 -0400, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> - add ref to matrix-keymap.yaml.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add ref to matrix-keymap.yaml.
> - remove properties, which already defined in matrix-keymap.yaml.
> - Add Vladimir Zapolskiy review tag
> ---
>  .../devicetree/bindings/input/lpc32xx-key.txt | 34 -----------
>  .../bindings/input/nxp,lpc3220-key.yaml       | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
>  create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


