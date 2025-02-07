Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96B5C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mZhL/i95ufAfBWtuvZLq8ibK5stp23ydEZNFiLC6sWs=; b=Xhkp9Hjq7AaQqomCm/G2/sULo1
	+VxirsyMx7FOewvFETZXy7jQDqQ+d4MExWqTdoN+49C9P11xJC5GF/l0gmq2a7rPNfOwxoRriCKue
	tmDDos8C6j+vJBiWTrXWpBAUq06Y6cAIyzp6y1FTyJzLnYNIA+bDCT29bmpKtbWMJIusrh0GHb6I0
	oooJpE3e2WYmnNaD/g/dpMKwFt19Qco8i7yFQCu22vOQO1Zor8YDvGihKcLFhppSqJSBpyzBexW6B
	VNX1uYo/DPjq9OevRLnVcGiH7htJCUnNWjTQs9XCIBPzhbKLrp8neSwEle79bSygnLehCZMsJqVnI
	4edrq2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKpH-000000093zk-3gzj;
	Fri, 07 Feb 2025 09:39:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKnJ-000000093XM-3XKK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:37:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f3c119fe6so36222515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 01:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1738921024; x=1739525824; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mZhL/i95ufAfBWtuvZLq8ibK5stp23ydEZNFiLC6sWs=;
        b=isCrakp5AtoN/8lPELLn/zloiXQmD5t8u+PnjoPCcHxKXb3uKEnKBFUs/tRn8DNtYV
         mzD/pMz/qizfybVSaAqg+NitcTSrfKtlswvdux/C/Wkxu6M8eNO34ffEVjgDZLt+kxNS
         xomNdTvUawfq4qjoMz6xu+LojEoXi4AHN7HWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921024; x=1739525824;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZhL/i95ufAfBWtuvZLq8ibK5stp23ydEZNFiLC6sWs=;
        b=mhcnD6fixxljuQv3hz28UBIhHP7xYEfYhzrjpvb0M4kfaJ3a1FYOXocfdbcwgT2vty
         7QviKSWNL61RwdOUnS5gMOzrvxxELlTQ6w4L0MlNrw+vC0GjVruZkS9ZAPJdlfAuVvNV
         7BOOJZCL/0PfsUmFStueLUUyNH6bAsoDN592cCIVGwsJcfVu+HzTh2QVT58kfq1zEF0N
         FxnljRGibkEuz8f+VmZrEeDp3AsUU97nHsOqRlRQkrD1XE0zaGnhJCuyO0EK1XexZj07
         kS1Pt5O741d+1MYWXT4JpViBtAQdLecZCf+nZ1HsELPkPiKp/tshCZKk5gmzfEFlCC5a
         pyBQ==
X-Gm-Message-State: AOJu0YwfeBtxOUSPjmn4cH4zeLEu5LUB7XxxO5pVbqG6r1K73Dy1HUVI
	DT2d6FKKPPodo7VYWKFdxpJLtJnkzM8q9oag7k8uRazDPkgwjYkyBkiNMryz/hAzIDTeVjBlBsK
	k3B4qiyaM6dp4yhMMzRP79pSLQee1scH8AND3tw==
X-Gm-Gg: ASbGncv395QKgiCgPMD+O85wHp1heZmUzGapXVOx9Hwdf0dZcKhTGE48pEaeeLUG12Z
	NCfJbFX806bXSQ8vb6Pc/b+fKQE0mAKzXDfRNCZUOHUqYajAMUN+wcRLGTpfVZoCrNrK7Hrxg
X-Google-Smtp-Source: AGHT+IFTLRhnIeDIBc4n+YndP4Au8s5C7yvvKdpJtnBdEJ/up0+6t3+ZYUTTXzsYnvptmiW9sQLE5qK9ckc0ExxBDGE=
X-Received: by 2002:a17:902:f787:b0:216:644f:bc0e with SMTP id
 d9443c01a7336-21f4e6c899dmr50764465ad.24.1738921024624; Fri, 07 Feb 2025
 01:37:04 -0800 (PST)
MIME-Version: 1.0
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 7 Feb 2025 10:36:53 +0100
X-Gm-Features: AWEUYZmCkCyH1BS9LZ9x1n2fW_-lsuLLPCRZlTScJUM6VWkGhV88TleerD02bZU
Message-ID: <CAOf5uw=SHCLAH21RbZCVYyU6m4KRD9g=KsYg0b9vq=AFu+cb+Q@mail.gmail.com>
Subject: EDAC on imx8mp and ddr scaling
To: Shawn Guo <shawnguo@kernel.org>, Sherry Sun <sherry.sun@nxp.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_013705_890346_F7D222D7 
X-CRM114-Status: UNSURE (   9.50  )
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

Hi Sherry and Shawn

I have seen that with this patch "arm64: dts: imx8mp: add ddr
controller node to support EDAC on imx8mp" but on the same time
the ddr scaling is coming from arm_smccc_smc DVFS frequency scaling
that is managed from imx8m-ddrc. We have tested it a bit
to understand if the circle to have the code call from linux to ATF
was somehow working. We don't check other than small things.
If the imx8mp is compatible with imx8m-ddrc and synopsys memory
controller, should not needed to merge the support in the
synopsys connected to the board platform data?

Best regards
Michael

