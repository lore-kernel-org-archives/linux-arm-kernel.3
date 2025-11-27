Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A1AD116E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 00:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hb37+eqY9LuToN0Iyo4OSvoNajzOsts2KWtu7XI2Rvw=; b=IKaGybeVIp+l6VTTyYv3RiwK56
	zT0YCwdgx6XapBYpuJcm4a2TG1TKmdUImxI+oG4xZ2ApR9nGG1oykRKjDqnnDsss2UOWa/OMgfvS6
	/p1YsRqJFTCNUdOc/cBGgl2Ljjs5ubx4Ikl/3ecB0EZq232ZZbn+J32GCA1YPdhoUhK2eESTxS1p5
	SsyDIvjUdMtCLmK0Df9WF+sZXLOCAxBLr8lmts+rdcbieqSvbwrUqeaM+5UCeQLvczvSV2yYHSZjo
	DsC6ybB560rhHyM5MkuvjEreTAHFEAgHJHEa7PcxYmhQdFwXJR7upGRk4CMt0JstIf80X858Qzc4s
	6q1+ghgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOPqK-0000000FnVS-18qs;
	Thu, 27 Nov 2025 00:26:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOPqH-0000000FnUx-2qfG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 00:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764203195;
	bh=Hb37+eqY9LuToN0Iyo4OSvoNajzOsts2KWtu7XI2Rvw=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=nO1lNCriYhjd+Th5Ug/C9mLvQyC9pE9be4c8sZStk8tFw6J5AJ2nW8zAaZhYTp8EA
	 X4iaNX88B0ND7ko441HSsgvZlwY1kt9Kllqyy0a0UXV4/WzE3FliAT0lTKcIi3FXU8
	 sBbkJAldQFp5XkMQAuccsrp99ASrNFWMZq59J896AGQHIrY8d4fP0XviGOkZPAxLXB
	 eLnlM1q7kTk5q5LcktGXbTt4po7ygqR0bAgxULD4qEv7FbGy1IhNuZqgPy6+bQXvd7
	 PrSa5bO3Gcu3cc6gO5A9vtVPcG7mlDKbdk0qn9gsktdz4stm3SneunoNVYVHdOooug
	 AV+9dcU0djuNA==
Received: from [127.0.1.1] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D43646561D;
	Thu, 27 Nov 2025 08:26:34 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Fred Chen <fredchen.openbmc@gmail.com>
In-Reply-To: <20251125135934.3138781-1-fredchen.openbmc@gmail.com>
References: <20251125135934.3138781-1-fredchen.openbmc@gmail.com>
Subject: Re: [PATCH v1 0/2] Revise Meta Santabarbara devicetree
Message-Id: <176420319478.134548.6539551998232385591.b4-ty@codeconstruct.com.au>
Date: Thu, 27 Nov 2025 10:56:34 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_162637_913223_87A99116 
X-CRM114-Status: UNSURE (   7.73  )
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

On Tue, 25 Nov 2025 21:59:29 +0800, Fred Chen wrote:
> Summary:
> Revise linux device tree entry related to Meta (Facebook) Santabarbara.
> - Add IO expander node on the switch board
> - Add SGPIO line names to control ASIC module power
> - Add IPMB node for OCP debug card
> Fred Chen (2):
>   ARM: dts: aspeed: santabarbara: Add swb IO expander and gpio line
>     names
>   ARM: dts: aspeed: santabarbara: Enable ipmb device for OCP debug card
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


