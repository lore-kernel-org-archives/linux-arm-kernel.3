Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C055C02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 05:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHzzpFNmIfwWdlNXYyTx0iN7gtiOz4Jj1PJOMYHhhLI=; b=kpYJKMCjNrh9LuF1CQSd1VmHim
	nQUavubHlQQ5AjtVmPd8kMpVeD8HWSePzV+OXD7Cdr8nlIaJWGI0STxBd50lkb2XAKfdCjU2/I6Kd
	rIx4SnhmDjSXNlWO2sG3NRzSOeGKDmY9x27+nuIezA51A38TQ7UpVsLlIEf13QHRApSmLmRct/G6z
	oaZhVnHhuxHJlHqctudpyocmQUVm3jVSgD2Sw/xcBVUpCAp/M6SPB64ioK6jG+QTjYTOchgH6OqwC
	3bt9HD262X6U8DHJor6ScTOppJYehIiy3EvDRh+de+q/Fv9XPvOvlZ0LvXztzZae4GFItq4KRpDyP
	W6lhGd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjWb-0000000A1MN-2oHS;
	Fri, 31 Jan 2025 05:25:05 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjVH-0000000A1Jt-0aSW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 05:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738301016;
	bh=nHzzpFNmIfwWdlNXYyTx0iN7gtiOz4Jj1PJOMYHhhLI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LF+vZ1T/ZDcs6L36WCIVarRu4CvhnOcCgHa6gtqNOQE8Ky+De6rWDcomVCauqHenr
	 pkWATCkD1EcEKItAiBu+WfRiKmacMuOUddotmMn1znrwT7rbCosVoHVn0ENhMsqiyk
	 ilo+8Lrkj75Rp/IgscW+kRlQusQoCjnbobzl6TOmBGTcnp+0MLSKNYDjwOp6CnaegA
	 8moI301FtJieCFeMKA0rzympQE/b6EZyRL0s9lcEpstwqcHFRGjeh5m6Wc5h4S+Pq9
	 4hlPmzr3HSsA/TBMRx9oB3+lWHQGJbOLGS2t3zdTJhgMkNT68Sl1/FoIVwoBXFkU8f
	 r3jNVrNCJwBHA==
Received: from [127.0.1.1] (ppp118-210-186-162.adl-adc-lon-bras34.tpg.internode.on.net [118.210.186.162])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DC97171747;
	Fri, 31 Jan 2025 13:23:34 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 devicetree@vger.kernel.org, Andrew Geissler <geissonator@yahoo.com>
In-Reply-To: <20250115112239.430636-1-joel@jms.id.au>
References: <20250115112239.430636-1-joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Remove swift machine
Message-Id: <173830101484.93883.6382944476465968904.b4-ty@codeconstruct.com.au>
Date: Fri, 31 Jan 2025 15:53:34 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_212343_388667_BF86BF16 
X-CRM114-Status: UNSURE (   6.31  )
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

On Wed, 15 Jan 2025 21:52:38 +1030, Joel Stanley wrote:
> This machine is no longer in use, and support was deleted from openbmc
> in March 2022.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


