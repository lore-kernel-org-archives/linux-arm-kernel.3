Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26363CE8E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08lXJgKcAe8N3lleod88TNBbTcd1+2/PW8hqN4eL/LU=; b=xLlEg/2s+w7I2GMr5dgRCMBOOY
	nhnmOQNModO1WM8gyUMWfIxczLjXoPe83yNDUjiMbe39FPJfnkPdQrDDMIUhjDiIDfb6vMuQRmfa/
	8kWLW2CS9Qv8/gJWu1uEYY544wolcjwAMkfX+EJ+5qHuubj8xZtbi6k/wz5MBbo43Jq77GIEqRRTi
	+Wfmdf/kmHC+qURgitW31+9ticaZBuEQproSkQ31aU8U8RBWJx7fG7wSBGkryskWy11vLMx77Y1T/
	af3vgyGqm3MaDbT1B1S5wCyTM/kgZ30TlQiV/O+37fJEZ/P0eHnbMhafbGBtNdUGTCO2FdwiInM1m
	tMtEnDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xqy-00000000V2t-24HN;
	Thu, 24 Oct 2024 13:26:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xnu-00000000Tru-2L63
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 13:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=08lXJgKcAe8N3lleod88TNBbTcd1+2/PW8hqN4eL/LU=; b=Y+a8rBsVhVtNSyK0WXxleuhqnf
	oESmQrXtaEzGFzKiAiLjtXU0N/qJBqAHiWmB1vLGC2Jl0Ajxu1m3oquQjk8UPxGRVzKig1oyJbAna
	ltDB33ZL50oWVUaUQatTu0jcvRDbqT1MJIizUABjdF8HoiBiW4YNM+ZMtIl+UPgDY8x8slOGKnUqn
	XWBZwrEiF8j/RFujPCaFX3XBNJfD7DFXFQb4jg6fEadgrWLlmL7mrnN/e1SlQFBRFAWBTATB96qWV
	uFqwLXwNEVOODPuYvFHkUh+Z/+OgqL1M5h/NI7dNOHWHIZK2TnMTRkt9oYLFDmRO3yYemCKQHs/Fq
	mNlC5gSw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xnr-00000008faD-3Tlw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:23:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76001A45419;
	Thu, 24 Oct 2024 13:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B136AC4CEC7;
	Thu, 24 Oct 2024 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729776180;
	bh=xYOd1PGCn+k3tNRpgbdP98I0aYi1W9inhgTkL3ocTDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UE3qlqocUQQwG7+oevrCYRcqdU5t6igksP5NXhM/w/Avp9vTWc9do/b/XFIaLNfV5
	 nF5Mu09+yamxjgYhYGBEQmyp0jczN/DdGoDW33UtiPMUXVeEbuIhBF22CiQpgWVwV0
	 qUkHRqiDvnAE6+n+Gx1vJ81KFaa+9tUo6F6L3DmpRpnwHnc377u3qWPsgOaTM457VE
	 v9l5/b2mhN5jG+3lRx8YjH+eLwlL5IZ6wRAjXlWNtm0ptENvdOtcjvulFw+AvWDq6L
	 LQWX29+MFnAHc+tALWO1lyKg/mbG/pBQ6CBRa5K0LSHIpv+WZigHO6oDUKFVVqZmqs
	 gAPURf4qcQhJA==
Date: Thu, 24 Oct 2024 15:22:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	"brendanhiggins@google.com" <brendanhiggins@google.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, BMC-SW <BMC-SW@aspeedtech.com>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Message-ID: <c3ss6ralf4tpyknsda5p745a65xjprlzecdq3s4zy4dpckuxi4@izf7emrzykay>
References: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
 <e06a0db538bf62d4aeb7352ecc81a3a679fb9eec.camel@codeconstruct.com.au>
 <TYZPR06MB6191EBA63B87FE5152AF029DE14C2@TYZPR06MB6191.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR06MB6191EBA63B87FE5152AF029DE14C2@TYZPR06MB6191.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_142304_026008_C84AC460 
X-CRM114-Status: GOOD (  14.23  )
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

Hi Tommy,

On Tue, Oct 22, 2024 at 02:42:08AM +0000, Tommy Huang wrote:
> Hi Andrew,
> 
> 	Thanks for your comments.
> 	I want to fix the situation when our controller is set as target mode and reading / writing by other i2c host.
> 	However, this host is stopped by any other reason (DC on/off..etc).
> 	It will cause the controller is stuck in this situation.
> 	But I find it might not have clear hints to identify this situation is normal or abnormal.
> 	So, this patch should not be applied into mainstream.

Please, avoid top posting, I don't understand which part of the
original message you are trying to comment on.

Second thing, please, before sending a patch, always always
always make sure that checkpatch.pl reports '0' errors and '0'
warnings, except for few sporadic cases.

Andi

