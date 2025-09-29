Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6262CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 03:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koAfHQgZNFwz/G/RE/7xAxl1N8KZz53PEKfz4qKLMuY=; b=tE4QTKbXT7LE4ZIYtK0/Xv8LDA
	75sJlMrlrnVljvbgA2F6J8I2ftY+/LyajshA40FO16UXUO8naZyE4qWXlL0neUV1Lh9nleF0NmZFj
	/VkZo0mP4OCK4ojC/nydJrFpAcqTagGryNvdb4HXZzuhgPLBEN3HOMZKUhl/a7BvkxP26etXSkZ77
	EKX2Qu9pwNflMGMcY4sNBYZWAJkBXY+D46sDILeT3/PWFf+75vpEeV3fQO3SNE6hTCaSWjqWrqLTB
	eSh7Ax2iaB002rlasewunZ6mDck4qcRs65oEqp2Mb+xqquKgMXCQatHP6+dlc9OIf0yB7WdBZPtjX
	cwUHqeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v34Ee-00000001Blx-2GuI;
	Mon, 29 Sep 2025 03:07:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v34Ec-00000001Bks-0taS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 03:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1759115248;
	bh=koAfHQgZNFwz/G/RE/7xAxl1N8KZz53PEKfz4qKLMuY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Kmlp1YXXAOz/7ZGIW9e0lQD8xPI5hP+N/TxvRozjHOWeSUmUdTz1SFujfPG4e12q5
	 pxh9Krxelay0STWxI5Xn88h4nZHknyAI8gfvWeUl7Qbs9JSrKTLHPcWm6aDnqel7mA
	 aiEA7ln5lGE3IWDvBdK1K+NNiWoebrRmLK36jebtxEd9Tick2WcVIJxGdpS7dN34V+
	 mHL9MClCiqRN7rTxu6c/OmJo2JeSL8OBF0mx9NRXhUa17BrUtUnfkULtKWAXwygyfq
	 gCrcBGBCahkJXCl/Yq3C0pUHQFm1NU+4/DfG+EgX9DcmwXXzwlypcMFM+PN2UVjSzd
	 VJyqbGWPHVSdA==
Received: from [127.0.1.1] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 88D5164782;
	Mon, 29 Sep 2025 11:07:27 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Daniel Hsu <d486250@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>
In-Reply-To: <20250926025952.3098933-1-Daniel-Hsu@quantatw.com>
References: <20250926025952.3098933-1-Daniel-Hsu@quantatw.com>
Subject: Re: [PATCH v1] ARM: dts: aspeed: harma: Add MCTP I2C controller
 node
Message-Id: <175911524746.2942521.16055072946484139660.b4-ty@codeconstruct.com.au>
Date: Mon, 29 Sep 2025 12:37:27 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_200730_448720_9E22244A 
X-CRM114-Status: UNSURE (   8.20  )
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

On Fri, 26 Sep 2025 10:59:52 +0800, Daniel Hsu wrote:
> The Facebook Harma BMC uses I2C1 as an MCTP (Management Component
> Transport Protocol) bus. This patch enables the controller by
> adding the `mctp-i2c-controller` node under I2C1, with multi-master
> support.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


