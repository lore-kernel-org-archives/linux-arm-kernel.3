Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1AFC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Ag/W9YjfbFJOGLdiTXWgO7Nle+kHbv1rgCfGcU2GBw=; b=ulbSrly0TiaNvWNOMarNvIzrM3
	mpZ/l0glKOQHgiABRgwXEauPbEH+UvV6eD8jAcjVXkubhbB6QechU2C1aCRauFdRaA9vOAY1jdFhO
	myRJCe95bfHHVChus2Q4exLaUULR9FV2W+pxRg9gXarsR85BNQsFZFTaiCxj/5D3g7cNRmCNFgGOi
	8EfwykKotDVOVilvbq/9L+Et1gUrn8Nss2uvquIGxgYgfRFVxkr4wpHWMszigGQUfxUSF1li/LNkW
	dGcc0LJuXHZlXZTtqzWaieNrnUZRMcoOwaaBLlGkRA0KJDN+XRwMJcvTUR9FIFdQrqY0amQ9ZM3Tr
	3ma4Fq6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO7F-00000003jtY-1b9f;
	Tue, 04 Mar 2025 08:59:05 +0000
Received: from mail.commetrax.com ([141.95.18.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO5f-00000003jaA-04yY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:57:28 +0000
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id 4C8AF239C3; Tue,  4 Mar 2025 09:56:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1741078586;
	bh=5Ag/W9YjfbFJOGLdiTXWgO7Nle+kHbv1rgCfGcU2GBw=;
	h=Date:From:To:Subject:From;
	b=kTx8pbQgDHbwdVR70qWjyMnHpvPRR9LvxUdFGav9GU9FQNfCyNY4OVfIVLJJwnmJb
	 BsjACEoF6WeRzSjQxP3BF/OphEzkltnbGsFVHxlKlFCsR62m+ESKetMNq/8dcVamEy
	 VGXbGbrqGpntDlBrsUcGj/b1ogm+sJrowkTkbb2YVtjCPRNOBYAzzqvviOTbb5809Z
	 P/Ey1lKhNwSqvw5oUhdC/SUxq/mOoRjceRPAhLSjCQUoN66rkqlWQCWeRt2Ash2wJF
	 i3NNsvkcCb8vmneQz/ciXQaKIGZMAArlcVeRBEy7EmisaO7wDCMcGbJZgicdGNxn2r
	 ADlbxtO75Fx1Q==
Received: by mail.commetrax.com for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Mar 2025 08:56:19 GMT
Message-ID: <20250304084500-0.1.87.ney5.0.36epr14hoy@commetrax.com>
Date: Tue,  4 Mar 2025 08:56:19 GMT
From: "Vincenc Turek" <vincenc.turek@commetrax.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Message from production
X-Mailer: mail.commetrax.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_005727_202612_43C74D3C 
X-CRM114-Status: UNSURE (   2.94  )
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

Hello,

We specialize in manufacturing packaging for the food industry, such as t=
hose for ketchup, mustard, and sauces.

We also offer solutions for household and construction chemicals =E2=80=93=
 packaging in various sizes and shapes to meet your requirements.

Our products are durable and resistant to damage, ensuring faster and has=
sle-free transportation of your goods.

How about a short presentation of our offer?


Best regards
Vincenc Turek

