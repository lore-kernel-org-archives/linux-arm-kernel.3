Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961F0C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waIuGDxzOof05Vhn6AjjPmoLjfrUS90zPIn5MbLu1PU=; b=F/ivIA6/joS63paQEaIGlLklr9
	PHpwH9evbgo779G3UUSzHCftzOm/5oE5iZMmAYrL24zSuR94QKeKjQDuICmJmmysnRMq3wFZb/rlI
	Ymt/egmx9HcjWNKGj51KmS/mJZIhQQqHS7qFOf19G7hh694Qx9ERSuUblWnkHAWvOpmVtxdMEmMCe
	umY95OpsYdD9JYknN9rD+QVZF06TBnzSlbz3PVQxW4gzX+utsvG57L1ypHrmkdg6qeNoZwA5C+Qva
	mWOMVMb3MGJuGPhvVj/PbVH8XrquM0LltZtae61mnR+T+G2lv+EXTZ4Y7lG2rsoEOHi1NEZtamQFu
	orxC2QPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYqd-0000000C9D7-18VJ;
	Wed, 22 Jul 2026 15:27:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYqZ-0000000C9CU-3xxz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784734017;
	bh=waIuGDxzOof05Vhn6AjjPmoLjfrUS90zPIn5MbLu1PU=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=lnCHSx6RJJJ/FNMGq6GCjXdFeUZFW9bzPLhcrXaf5K21B+BxKMAc1VUoJZDPvHn4k
	 h1Jf/kBPDawh3n2oXk1KvNNcbm9jpVHPqgdUkEwuql1s0xJijctTgmaKLYTTeJYnWt
	 B50j4tPhWLJanhtinsmYfKbnEORudQRL0bhPj9EjmnN5RAYpMqmcYNhnrmt3fUAioe
	 abqR6ClYwXtG2v+/kG+F/lgKCt6uEdOl8xVs4Uz85OCbIG62qf+8ECUSXH100tR/nI
	 y4/Rnt5hqxKKPLLgyBEUEjbBiIGr0zZCH6CF7Oc3qafgnmGM/bX0VwyDK/2m4D/TSX
	 4f/yIhcWArxgw==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 715DA656B7;
	Wed, 22 Jul 2026 23:26:57 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706180307.635369-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180307.635369-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Correct indentation
Message-Id: <178473401740.1970914.2575839372513973839.b4-ty@b4>
Date: Thu, 23 Jul 2026 00:56:57 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_082700_182834_005BF874 
X-CRM114-Status: UNSURE (   5.40  )
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

On Mon, 06 Jul 2026 20:03:08 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


