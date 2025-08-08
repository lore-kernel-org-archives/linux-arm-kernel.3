Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC9CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 02:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/Z5CMd8EqF5C3UMm0RvWAXOy10PzdDqowUayHDZKGQ=; b=WBE45yJH5K8Cz0dKUIAfjdFJMK
	KBmvTznjlasci4zSu/ahFTz8zYMrgjQSfeG7CeJD5gIIhZD5kURtSHLsBWhtDxaxOzpXIaC302Ui+
	QxE6eXRkYGdFRLdC+Wo6MHPg629GIQl7K/7faA27iNCHjX1UxHamk5pSLbXxNfiWfoJra1dt6IDgP
	3MCBh1XBZGUaCgkp0PumdQs3QwQA6tWllDtFuNMRLMKwvKuQZmNeOlI4b/sUMqcvbGoO2kh+5R7m+
	yQyq4zijdX+jJxz+BCEJVlj0y/hI18pgweDBtZuSNJi0dTUPLpzm4DQd9gjd6XIanOYsHsjLVMTuW
	o8emjbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCRL-00000001piU-1VTU;
	Fri, 08 Aug 2025 02:02:39 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCOm-00000001pQo-09FK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 02:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754618398;
	bh=q/Z5CMd8EqF5C3UMm0RvWAXOy10PzdDqowUayHDZKGQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=NylGELSpdyLnmd+nk3zp/3w2Id/y8sk1xJZFnSo66Uj4i4pjruofrsSIM3teq513s
	 Rok9KjpM0wARz2r8uJmRct/edZoHBforpNC4l1k1FvSa/Hk7S9DQEm6NSTYXSj9GFo
	 10v19Io2DyYpe9FuG/rxgDfi4l5YI9n4dLkHU9ybLW0BOAIlj7zTBBzQo8aDy0apZa
	 FNdwYndbsbu5iN+HSgVmqAdBVMc4nrch7VXrxEORfbv+ncZUZcVlpzt+KqQKKw3G7U
	 zJonrGny/ZmP/3gguqwylkIwwKq1ye60LaJHID4EfzLI1D6uhoAX5r0CSvU+7rd2lN
	 rsk8lssptzd9g==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 02D7D6D59C;
	Fri,  8 Aug 2025 09:59:57 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20250807005208.3517283-1-ryan_chen@aspeedtech.com>
References: <20250807005208.3517283-1-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2] soc: aspeed: socinfo: Add AST27xx silicon IDs
Message-Id: <175461839791.140589.15788299148211671960.b4-ty@codeconstruct.com.au>
Date: Fri, 08 Aug 2025 11:29:57 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_190000_274527_FE3C47D6 
X-CRM114-Status: UNSURE (   5.46  )
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

On Thu, 07 Aug 2025 08:52:08 +0800, Ryan Chen wrote:
> Extend the ASPEED SoC info driver to support AST27XX silicon IDs.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


