Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E498C55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVEMBbEdefM7yw4jrExG2EaFI8XCUTLCLGP+UaBsQzk=; b=rMRZm8sDKJD+2ksUKjYz/NUdFU
	45mH2Uz/Mq01QtIAXakCfOem0MJIZL64sWtRKZXKOV9rBGXCSEhledWuXxAA8XQyC70zI1lGNIuku
	LW0dpqYiRuxy92zV4CpNs3NNU5hopHpaaavx2UCBiD0ZoThlEVvlyhguJoPmku0uk7Li8iN8pUcgi
	7E3G7b2wV+JTS/dzUz6tyRJ50fBJ2o+r73TK4X8WSo5PXEaelT0iZOY5qWmEZ0+wGONncjUBAao0P
	BMlLMxPgSakhejCb4b9yOSVVjBWoz3wcWg0l7JiFjkAqxN7rJkSWhPJKYtuCXCe1xnXd15RdjwDK6
	sxTl0AvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPVl-00000002yDr-1WgG;
	Wed, 05 Aug 2026 00:29:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPVj-00000002yDi-3rgD;
	Wed, 05 Aug 2026 00:29:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C258D60052;
	Wed,  5 Aug 2026 00:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F5A1F000E9;
	Wed,  5 Aug 2026 00:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785889770;
	bh=wVEMBbEdefM7yw4jrExG2EaFI8XCUTLCLGP+UaBsQzk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=MqAoRhfm1zlG8hISZxXC9aRivBnaEvPzdNFBBBHfSHKBlsKVlZzBNOrghJirMVk12
	 aXbziJiP4Rj3/So76Q0nQh9vtGLjxySwQsx4sE6SlawSIl2tN1bo44PoBfIuXSkkZg
	 jLCErxwpJMkC4CHj5/1cIEBCXz//t6+mRgDGCblwdqrD0Qpz0ugk4cFt8CIvcFLgdS
	 xwMYAe7GE5JChqwqsOYMbijdN0K5M6UNI7uVG3i2TOoMjLlOColEXzQc269Ul5It9v
	 4EoRZ5QVAJP0iU0pN9CYAoeDqh979YQGenaf/56OrjUcVnfiKOTdflbHRyqhxbTn0+
	 p14QBWYOHauuA==
Date: Tue, 4 Aug 2026 18:29:28 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 04/22] dt-bindings: riscv: add Sxcsrind ISA extension
 description
In-Reply-To: <20260701-counter_delegation-v8-4-7909f863a645@meta.com>
Message-ID: <66661b25-5cef-6590-b885-31cf954a16ce@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-4-7909f863a645@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Atish Patra <atishp@rivosinc.com>
> 
> Add the S[m|s]csrind ISA extension description.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Along the lines of the comments on patches 2 and 3, here's what's been 
queued for v7.3.


- Paul

From: Atish Patra <atishp@rivosinc.com>

dt-bindings: riscv: add Smcsrind and Sscsrind ISA extension descriptions

Add the S[m|s]csrind ISA extension description.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Link: https://patch.msgid.link/20260701-counter_delegation-v8-4-7909f863a645@meta.com
[pjw@kernel.org: use official extension names in the patch description]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 .../devicetree/bindings/riscv/extensions.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c0..ccff2be1224d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -181,6 +181,14 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcsrind
+          description: |
+            The standard Smcsrind machine-level extension extends the
+            indirect CSR access mechanism defined by the Smaia extension. This
+            extension allows other ISA extensions to use indirect CSR access
+            mechanism in M-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -226,6 +234,14 @@ properties:
             Profiles Version 1.0, with commit b1d806605f87 ("Updated to
             ratified state.")
 
+        - const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Ssaia extension. This
+            extension allows other ISA extensions to use indirect CSR access
+            mechanism in S-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: ssnpm
           description: |
             The standard Ssnpm extension for next-mode pointer masking as
-- 
2.53.0


