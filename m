Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D303FE7C6F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 01:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIR4lVMnkdb804M5R0VdfzVoSc5X3oa8pX/88m18+4Y=; b=FgmCwqoLPkPY3W6b1DsOO+Tdvm
	rDJ1+4InV/zGbhpR1pc9jrwyi3XKffTyk7wl6p3dJafcIuMjZKWJ0HfXhsU+fC0Ve8SlHtW1XUYUh
	fhtdgovJTICGoa/sn2dtXQTeZFWPlzcevQQZ/BOI3LQA/A5XqcXoh1jD7FVIwY/dozT+BqKUs8sAA
	BSUNFm9CmAavhviCm66Oa8OtTj9G24GHRffDPXyaBBQfokTeb7QG3gNf6x2eR0t1zf1XV+qS870Hl
	s1ClPRIo08EH1uNHje7AcIAEB6LEcIZh9ine+LE924VA6ig4YdPNn/QG+Z3W+khD00JABVHCwxl4r
	T/DoeogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuKuq-0000000H7QU-0Gct;
	Mon, 23 Feb 2026 01:39:16 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuKuo-0000000H7Q6-14lc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 01:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1771810744;
	bh=MIR4lVMnkdb804M5R0VdfzVoSc5X3oa8pX/88m18+4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Y6EXrtL1+IpDBKjQ+CE4IfTVsQtB4H+67UIbgSuuUBAw/68tx9orgqZhqB0my/a2e
	 DcfYfLefmXr/bwwiAnrpkKeEjF8vwqRW8pjxh906dww/IGvC7hTxGaMyqfSYy6TqQH
	 +/gGcNSOJpZngELx/1DV3zHiXzV+ftpQFDjjzCWoQ5GyHO8oeP5U6/L3Xmgl+pBs1B
	 NvPSZDM683jbwEBUqsiJOWJBqaM2uo+UGA3UFXk1F2H3ktnHOtuRQ/1eA44KReyEo7
	 lsGV2et7gbICX0wqS0Jq5Fo1dNVK3LnfRb2Mi/HPdrojDzDPxaZQBEiTHpmCNafSqT
	 6tGr3RRVwS7Tw==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C9C45600E1;
	Mon, 23 Feb 2026 09:39:01 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Dirk Chen <dirkchen@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260219-b4-anacapa-dts-fix-v3-1-4f70fd2d1070@amd.com>
References: <20260219-b4-anacapa-dts-fix-v3-1-4f70fd2d1070@amd.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
Message-Id: <177181074172.1150784.15634520346683503197.b4-ty@codeconstruct.com.au>
Date: Mon, 23 Feb 2026 12:09:01 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_173914_513179_339FA9D0 
X-CRM114-Status: UNSURE (   6.99  )
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

On Thu, 19 Feb 2026 23:44:47 +0800, Dirk Chen wrote:
> The Anacapa board features Atmel 24C2048 EEPROMs on i2c0 and i2c1, which
> are used to store retimer configurations. Add the corresponding device
> tree nodes to support these components.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


