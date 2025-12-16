Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E297DD637DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 22:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLlGX/Zb/h89gFUDI2kAuu57cWdmtK2L0VrOOiUfD2M=; b=E/oPA0yoLbqS4xHHEhkdh4Iq3G
	PYO8DzGvpc/wFvApRXi+7Z5+SqWwF5dmgnvEh4i1rTkuB9o57S2hOgpLFaKEu/EPkoDa3VoWIL5sP
	b3Ma3E/TX4ZixePPWdHaakc4dJnMlvlhSkBz2k7myIzeiJOaHWvuvswSVLTOboy7Zv0bTLqdqnAP/
	R37d1O0W8GkvFu+R9XKkILUclTOwbwahfGmVSNAzR1J9w1DbtWnkwlZres3uRDU6Q8LI1XTc0qEdE
	60vaBI/scWYicqdc41O2tV5hV7QuhI9ub85I8yc0On5887ITky+h5oANOlnOVVxOPzFZaWTyDEwTL
	iZkfoghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdXS-00000005te3-2MVD;
	Tue, 16 Dec 2025 22:29:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdXR-00000005tdx-2nLA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 22:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD29B60097;
	Tue, 16 Dec 2025 22:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEC2C4CEF1;
	Tue, 16 Dec 2025 22:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765924140;
	bh=EL1DAB+aQaWawnqUTU0r/jA74EFo/IqWPPi5ybJq/c8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQXJNsX5rb0dPNGdTD3o0u+w+T8WwVYm4+XFZmNexoSELyzKK/qM40sLpe5O5N4et
	 QtqrUgX1rBNaUGr2+Stin/j0XetNCrhaUO9nJOIuj0pXA1ch9Re6CR80jET4V1xRCD
	 bqaIFhJZrZRcUFGkmwzMMl8U5bF/OC7jLk0z+n4sHJz0WQNB+VsbgAz2seKpCp+P+j
	 wDoMimToYHhBeA0hLd882Szl34762yptF7gOHPBkhiwf9fDapgz6WPMcEWMr3y39i1
	 Kz1rlyuQvlU9rEzEtWl4L/kC1hntyksv/6sO9DG6zYEJhl6DtCOqCuMvRshx7PLrRF
	 AWuzT8xRP32Dw==
Date: Tue, 16 Dec 2025 16:28:57 -0600
From: Rob Herring <robh@kernel.org>
To: Ronak Jain <ronak.jain@amd.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	nava.kishore.manne@amd.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Update firmware dt-binding
Message-ID: <20251216222857.GA3151380-robh@kernel.org>
References: <20251212100542.2756757-1-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212100542.2756757-1-ronak.jain@amd.com>
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

On Fri, Dec 12, 2025 at 02:05:40AM -0800, Ronak Jain wrote:
> The patch fixes/enhances below problems,
>     1. Add missing compatible property under the example section for
>     zynqmp_firmware node.
>     2. Add conditional pinctrl schema
> 
> Changes in v2:
> - Added acked-by signature in patch #1
> - Following up on the queries again in patch #2. No code changes in
> the patch itself
> - Dropped off patch #3
> 
> Ronak Jain (2):
>   dt-bindings: firmware: xilinx: Add xlnx,zynqmp-firmware compatible
>   dt-bindings: firmware: xilinx: Add conditional pinctrl schema

Applied, thanks.

Rob

