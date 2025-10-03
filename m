Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3071CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E8lJQPfLjYVHk8CS76IyIm3PF5+xLeDEh0bD99wDfoU=; b=ZK86691ZaSKdUV0Z+6D10ydy4r
	5D/gpv5BHKd9gHp+QrTTusDNsgks3bWtG7KGDqal5gjnp091F0Oi1PEGB2dWZ5EuWPjGnmL222pQt
	8/qLa3Jptb2gf62QrPYRAHCIg7dTplGRiZUN6cm3MWz59P4ezGc2sDRKlmV+tWDcVcaTbGn7n8qct
	5hZ3+W6AcNpj5xFaWpx1zQnftmQ2GNQbAUqzhBBtRhwohxg+Au3NRIjwAlf82mgNvtPZx5PGmYt7c
	cX36O/YFp8XAV3rW8HkuKX/YoyKYODC7cctbHpaGnUs4YO5kfc5ES/DbLZFDnAumS6B1q1Uiw1NZs
	6RrYoOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4aZZ-0000000BqYW-1LpH;
	Fri, 03 Oct 2025 07:51:25 +0000
Received: from mail.commetrax.com ([141.95.18.165])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4aZW-0000000BqYC-3M2F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 07:51:24 +0000
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id 6AFA7248C8; Fri,  3 Oct 2025 09:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1759477880;
	bh=E8lJQPfLjYVHk8CS76IyIm3PF5+xLeDEh0bD99wDfoU=;
	h=Date:From:To:Subject:From;
	b=HvwXxMQIjibQzRdkwpO17sQss/QrIfr0eKtBDJEukNARU9XV6/6dA/c+LRLLbJe+S
	 177X2A3EWo3fNSL0ofDNxWU6v6l4BWfTTuXlc65QoJFh5KwCLTo+MpMOYjpRC4wAaw
	 DdpRKN0wM/a9Eg4oIwwdDwZPgEANUk64r697Z6f77ToGhFe3o9+ATNcbGuFC2WjZ1+
	 PqIkZ2EjzwQrlYnJnRLYNVQ73v4Wlcf2cFqIfnwbP1zJnutwzAOo+ibghH+qxMmgAH
	 SPn0oMBzOS4A2I9ZLvqFoVLzv8XO0z86DqhKNkfEgbotWUzvZoek7YbAXf6Y4Hd/Aj
	 0Xib4bncnlBlQ==
Received: by mail.commetrax.com for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Oct 2025 07:50:43 GMT
Message-ID: <20251003084500-0.1.c2.151xs.0.qbamlfsifk@commetrax.com>
Date: Fri,  3 Oct 2025 07:50:43 GMT
From: "Luke Walsh" <luke.walsh@commetrax.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Welders
X-Mailer: mail.commetrax.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_005123_123537_BB251846 
X-CRM114-Status: UNSURE (   0.43  )
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

Dear Sir or Madam,

I am contacting you on behalf of a company specialising in comprehensive =
industrial services for businesses requiring the highest precision in com=
ponent manufacturing.

Within one cooperation we provide the outsourcing of certified welders, l=
ocksmiths and fitters, as well as professional welding services and the a=
ssembly of steel and industrial structures.

Consolidating services with one partner allows you to significantly reduc=
e costs, minimise the risk of downtime, and increase flexibility in proje=
ct execution.

A dedicated coordinator will ensure on-time delivery and high quality, he=
lping to build long-term, trust-based business relationships.

May I present what we can do for you in this field?


Best regards
Luke Walsh

