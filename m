Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BB4F5513F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+/1xtYEU3NocW0J75gRDc6PSsA6Clg9FbQN3bTRhsU=; b=K8/2965HiqS7NjAzIWxSuBpezM
	epAdGLDbPCP4Afa0JREEgKqF+oYtOtDu0G4SECLTw0ns4DT3tFXgVxDLFV45V1JpbY8KIbWVjxTTm
	XYvLfC4HFALz2c+Xmlo5o9Kl7JWgl7pQ5DYbm/Z44N51t7FXSXRu6+z8oLMvd6TmNu6VjrwcIaFLu
	00r5IO7ytgOqyzfqNNsbCQeFk10FB4ZQKjSuS15+S7GOWejwyHdelaBmrengVikFCgOpOFxxsJPWh
	qDtFdHxxEZonQ/VPS0KGLIdAmx44rEn2p6Tv9sj7yzSzIIsWmAUKDehVDNWs17WyJMyeRo2mGxImL
	zAkK5zmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDlI-000000062Qz-0UNg;
	Sun, 08 Mar 2026 13:01:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDlG-000000062Qt-45sz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 13:01:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DA5060054;
	Sun,  8 Mar 2026 13:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF22CC116C6;
	Sun,  8 Mar 2026 13:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772974893;
	bh=PegtPUAx1ynhrJYgVNPAky69gIj62ODvpNtpEi7eu6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dDRVSEtKDHf48WEJjRDU36s45dZxbWqf2Yjm4IumQCnV1VCv7XGZQ2w7uad9MAJ4W
	 ciZaPHn8roZ2eg60VTfL5zEP/rAPuI3WNPEnEH+jMTZYocNdy0OIaxLU43jrlqXwKP
	 dCV3Mv9ZNOPLdXOU0SXWDtoQBC+YpPoh1f6/xblNndYDGMmSN7zmcdWnZqVZZRrhLS
	 t7m+qvzDuXPEDH3etOABm3WCw/KlwskZzwaaYkKkBmSpwellBp834OHojHqnxQhw51
	 66VK8OeIsQaFbW8eC1anhsC5EzyDXjBiFiNYv1E0cxb/drLgn5XPGdb5bXgBtyqEqd
	 U0PQmbqLEfpoA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
Date: Sun,  8 Mar 2026 13:01:28 +0000
Message-ID: <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 20 Feb 2026 10:55:15 +0100, Geert Uytterhoeven wrote:
> Fix misspellings of "multi" and "currently".
> 
> 

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
      https://git.kernel.org/sudeep.holla/c/4e701b47c3ba
--
Regards,
Sudeep


