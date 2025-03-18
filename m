Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD3AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQa+8tLXCh38wxpuqC/UFWJialaNOAJe6R4eCwrtJlY=; b=vS8yREFFSUqz+pkZB3Mt85S5hO
	k1QKNCvYz8js6eAvXW2OtwVLHVW+D0CiwMwldRCzELjD71EltTlUQhJ61lUrG7EQ4wYoRwcfACmMU
	MH47s9P0VgpKa4UWfaqCzhmgpM6qLZbbTcpzbaKYDGQQpnH2qTEBI9edKRA3/H5ju8imPafODYO25
	c22p46n9YVxcS4mH9AuNr7+kjI1t25rJavzH3IvHfyqTH4qJCsWKvd5hdSth7PBTbb0j6y6wjfCY3
	0l00DSwLjQSaOjLXVB29tN4c5kfkMKqMP+Z7ypCsG0yocKb+xBc6j8reYYMbVFhy3m4eDuIo7AgKY
	dHnvBSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuScJ-00000005DfZ-0eru;
	Tue, 18 Mar 2025 08:48:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSZj-00000005D6B-1nX9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0231D5C5556;
	Tue, 18 Mar 2025 08:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF98EC4CEDD;
	Tue, 18 Mar 2025 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742287526;
	bh=xvR4q+kDcK2eJhnkZQxu0f9mq7keqwXDtJByURfUMBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mc0mPIzZcbkoWsgw/Yh+D4VVUkWFdSfIvMFA5e41vglhGpICtIJrlOa7pKfMamn82
	 XhoREwnpMhbcRL1xtHnbrRA632XsL3fcsP8NH8p96idE1tpO0vNe71nx9Wd8Dr4RF/
	 e5FfFG/FimCyHiVF5WIv66uJmd10dlYXedjbxgYSiWLDsmP9kllvAixBNW/kaEPybl
	 N4kbNi0bxwazA1YbOLiyddk2PQQFDssYSSEeHBd2fkIkRvmUbrLzjPjzF6XhTAh0U5
	 jlBP5uEawrXWuILN1fsoDS11F00d8zlB26UoKszf5zwXx40Pj+h7YPX4/KZiGEQI4c
	 6Pi1Pnz7UV9Rw==
Date: Tue, 18 Mar 2025 09:45:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: Re: [PATCH v3 2/2] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Message-ID: <20250318-imaginary-peccary-of-argument-ab6b39@krzk-bin>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_014527_517180_608243CD 
X-CRM114-Status: UNSURE (   9.70  )
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

On Mon, Mar 17, 2025 at 11:12:24PM -0500, Rajaganesh Rathinasabapathi wrote:
> +/ {
> +	model = "AMD Onyx BMC";
> +	compatible = "amd,onyx-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial0 = &uart1;
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = serial4:115200n8;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +};

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Best regards,
Krzysztof


