Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D79FC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ViNF3ZI4IEPivZK4iQepPlauUrX461PctikME+T1V0=; b=pHX1M3nocSPwq8SQlbYq88yeJH
	vjcFB5xb8+cZ5g7YkOa7nxp2DhpMcQzZak1Fpp0c38zMzIVjCg4E9rpivF02hBmwFxCQNzArE7Yui
	wxY5yr/40t6gFAKBB416hBP1mDA8f8mqCp3ScodrT7J9SKiFE1GaobcpxkZ8zdb57TIMNVow6JzUD
	thneT4XIcXxrF5rvPJfk2pKEVhB/o92mM9a/DLT5nU6GryQiXa+XRooTuowixJhvZGa2IwBcUxtjf
	DJspQ3tkR50iztYbgVjan1s0DI3LPsIHKxr+8/l+MZsvnkT96BvEbZnPhLLBX95pbann67JG//QwP
	hyLenMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYYw-0000000C6j3-3qlJ;
	Wed, 22 Jul 2026 15:08:46 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYYu-0000000C6iX-3mjb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784732908;
	bh=9ViNF3ZI4IEPivZK4iQepPlauUrX461PctikME+T1V0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Zj8k9ffqCugrCsViAKam4XcJyJfzIq74EQQtQaQTCHHc1OZGrWgBPqCTx3y3QW7ij
	 e78BTqGHnU59QRC1sS6MI7NK+yv696QwJvsy4YIx7YGBoX2SWoSG9iTs0G6BhY0TlE
	 xgFbEqoP0BiA97teg6QcdVB2u7Y/tAXGyqZCCVIYcdugHbiMYCNSUCMW6VTXvEy2pV
	 cuIvQ8HEfVPkdJfRmS94AuWOkIg13yTQ4LHQ1+u8uPXVZ42CKVPRxR3hFTO3WSFt/E
	 oC5dd0TyEIUOHNmEBhAGELAYImd0IYTxjfqKdCgsMupdHufWBAx/j3d3NeUUhd3cSB
	 2wCRiUAHdmzMw==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0799B65B37;
	Wed, 22 Jul 2026 23:08:25 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260704122442.85499-1-pengpeng@iscas.ac.cn>
References: <20260704122442.85499-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] soc: aspeed: add missing MODULE_DEVICE_TABLE()
Message-Id: <178473290536.1914149.8003428473620995771.b4-ty@b4>
Date: Thu, 23 Jul 2026 00:38:25 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_080845_135914_519B04B8 
X-CRM114-Status: UNSURE (   8.83  )
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

On Sat, 04 Jul 2026 20:24:42 +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


